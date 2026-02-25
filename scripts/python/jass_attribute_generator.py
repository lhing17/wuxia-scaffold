#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
War3武侠地图英雄属性系统生成器
基于现有的JASS模板自动生成自定义英雄属性系统
"""

import os
import sys
import json
import shutil
from pathlib import Path
from typing import List, Dict, Optional, Any
from dataclasses import dataclass, field, asdict
from datetime import datetime


# ============================================================================
# 数据模型类
# ============================================================================

@dataclass
class NativeAttribute:
    """War3原生属性配置"""
    id: int
    english_name: str
    chinese_name: str
    original_description: str


@dataclass
class CustomAttribute:
    """自定义属性配置"""
    id: int
    english_name: str
    chinese_name: str
    storage_type: str  # "real"或"integer"
    description: str


@dataclass
class AttributeLimit:
    """属性上限配置"""
    attribute_name: str
    max_value: float
    description: str


@dataclass
class SystemConfig:
    """系统配置"""
    native_attributes: List[NativeAttribute] = field(default_factory=list)
    custom_attributes: List[CustomAttribute] = field(default_factory=list)
    attribute_limits: List[AttributeLimit] = field(default_factory=list)
    default_values: Dict[str, float] = field(default_factory=dict)
    custom_start_id: int = 8
    system_constants: Dict[str, int] = field(default_factory=dict)


# ============================================================================
# 模板标记常量
# ============================================================================

# 模板标记定义
TEMPLATE_MARKERS = {
    "NATIVE_ATTRIBUTES_START": "// {{NATIVE_ATTRIBUTES_START}}",
    "NATIVE_ATTRIBUTES_END": "// {{NATIVE_ATTRIBUTES_END}}",
    "CUSTOM_ATTRIBUTES_START": "// {{CUSTOM_ATTRIBUTES_START}}",
    "CUSTOM_ATTRIBUTES_END": "// {{CUSTOM_ATTRIBUTES_END}}",
    "ATTRIBUTE_LIMITS_START": "// {{ATTRIBUTE_LIMITS_START}}",
    "ATTRIBUTE_LIMITS_END": "// {{ATTRIBUTE_LIMITS_END}}",
    "CLAMP_FUNCTION_CASES_START": "// {{CLAMP_FUNCTION_CASES_START}}",
    "CLAMP_FUNCTION_CASES_END": "// {{CLAMP_FUNCTION_CASES_END}}",
    "CLAMP_ALL_CALLS_START": "// {{CLAMP_ALL_CALLS_START}}",
    "CLAMP_ALL_CALLS_END": "// {{CLAMP_ALL_CALLS_END}}",
    "CONVENIENCE_FUNCTIONS_START": "// {{CONVENIENCE_FUNCTIONS_START}}",
    "CONVENIENCE_FUNCTIONS_END": "// {{CONVENIENCE_FUNCTIONS_END}}",
    "DEFAULT_VALUES_START": "// {{DEFAULT_VALUES_START}}",
    "DEFAULT_VALUES_END": "// {{DEFAULT_VALUES_END}}",
    "CUSTOM_START_ID": "{{CUSTOM_START_ID}}",
}


# ============================================================================
# 默认配置
# ============================================================================

def create_default_config() -> SystemConfig:
    """创建默认配置"""
    config = SystemConfig()

    # War3原生属性（7个）
    config.native_attributes = [
        NativeAttribute(1, "ATTR_HEALTH", "气血", "War3原生属性：当前生命值"),
        NativeAttribute(2, "ATTR_MANA", "内力", "War3原生属性：当前魔法值"),
        NativeAttribute(3, "ATTR_STR", "根骨", "War3原生属性：力量"),
        NativeAttribute(4, "ATTR_INT", "悟性", "War3原生属性：智力"),
        NativeAttribute(5, "ATTR_AGI", "身法", "War3原生属性：敏捷"),
        NativeAttribute(6, "ATTR_MAX_HEALTH", "最大气血", "War3原生属性：最大生命值"),
        NativeAttribute(7, "ATTR_MAX_MANA", "最大内力", "War3原生属性：最大魔法值"),
    ]

    # 自定义属性（示例）
    config.custom_attributes = [
        CustomAttribute(8, "ATTR_ATTACK", "武力", "real", "攻击力"),
        CustomAttribute(9, "ATTR_SPELL_POWER", "法强", "real", "法术强度"),
        CustomAttribute(10, "ATTR_CRIT_RATE", "会心", "real", "暴击率，存储为百分比，如10表示10%"),
        CustomAttribute(11, "ATTR_CRIT_DAMAGE", "要害", "real", "暴击伤害，存储为百分比，如150表示150%"),
        CustomAttribute(12, "ATTR_ARMOR", "护体", "real", "护甲"),
        CustomAttribute(13, "ATTR_RESISTANCE", "抗性", "real", "魔法抗性"),
        CustomAttribute(14, "ATTR_DODGE", "闪避", "real", "闪避率，存储为百分比"),
        CustomAttribute(15, "ATTR_LIFESTEAL", "吸血", "real", "吸血率，存储为百分比"),
        CustomAttribute(16, "ATTR_COOLDOWN", "冷却", "real", "冷却缩减，存储为百分比"),
        CustomAttribute(17, "ATTR_MOVE_SPEED", "移速", "real", "移动速度加成，存储为百分比"),
    ]

    # 属性上限
    config.attribute_limits = [
        AttributeLimit("ATTR_CRIT_RATE", 100.0, "暴击率上限 100%"),
        AttributeLimit("ATTR_CRIT_DAMAGE", 300.0, "暴击伤害上限 300%"),
        AttributeLimit("ATTR_DODGE", 80.0, "闪避率上限 80%"),
        AttributeLimit("ATTR_LIFESTEAL", 50.0, "吸血率上限 50%"),
        AttributeLimit("ATTR_COOLDOWN", 40.0, "冷却缩减上限 40%"),
    ]

    # 默认值
    config.default_values = {
        "ATTR_HEALTH": 500.0,
        "ATTR_MAX_HEALTH": 500.0,
        "ATTR_MANA": 300.0,
        "ATTR_MAX_MANA": 300.0,
        "ATTR_STR": 10.0,
        "ATTR_INT": 10.0,
        "ATTR_AGI": 10.0,
        "ATTR_ATTACK": 20.0,
        "ATTR_SPELL_POWER": 20.0,
        "ATTR_CRIT_RATE": 5.0,
        "ATTR_CRIT_DAMAGE": 150.0,
        "ATTR_ARMOR": 0.0,
        "ATTR_RESISTANCE": 0.0,
        "ATTR_DODGE": 0.0,
        "ATTR_LIFESTEAL": 0.0,
        "ATTR_COOLDOWN": 0.0,
        "ATTR_MOVE_SPEED": 0.0,
    }

    # 系统常量
    config.system_constants = {
        "MODE_ADD": 0,
        "MODE_SUB": 1,
        "MODE_SET": 2,
    }

    return config


# ============================================================================
# 配置验证
# ============================================================================

def validate_config(config: SystemConfig) -> List[str]:
    """验证配置，返回错误列表"""
    errors = []

    # 检查原生属性数量
    if len(config.native_attributes) != 7:
        errors.append(f"需要7个原生属性，当前有{len(config.native_attributes)}个")

    # 检查原生属性ID
    native_ids = [attr.id for attr in config.native_attributes]
    if sorted(native_ids) != list(range(1, 8)):
        errors.append(f"原生属性ID必须为1-7，当前为: {sorted(native_ids)}")

    # 检查自定义属性ID连续性
    if config.custom_attributes:
        custom_ids = [attr.id for attr in config.custom_attributes]
        expected_ids = list(range(config.custom_start_id, config.custom_start_id + len(custom_ids)))
        if sorted(custom_ids) != expected_ids:
            errors.append(f"自定义属性ID必须从{config.custom_start_id}开始连续，当前为: {sorted(custom_ids)}")

    # 检查命名规范
    for attr in config.custom_attributes:
        if not attr.english_name.startswith("ATTR_"):
            errors.append(f"属性{attr.english_name}必须以ATTR_开头")
        if attr.storage_type not in ["real", "integer"]:
            errors.append(f"属性{attr.english_name}的存储类型必须是'real'或'integer'，当前为: {attr.storage_type}")

    # 检查属性上限对应的属性是否存在
    for limit in config.attribute_limits:
        attr_names = [attr.english_name for attr in config.custom_attributes]
        if limit.attribute_name not in attr_names:
            errors.append(f"属性上限配置引用了不存在的属性: {limit.attribute_name}")

    return errors


# ============================================================================
# 用户交互函数
# ============================================================================

def print_header(title: str):
    """打印标题"""
    try:
        print("\n" + "=" * 60)
        print(f"  {title}")
        print("=" * 60)
    except UnicodeEncodeError:
        # 如果编码失败，使用ASCII字符
        print("\n" + "=" * 60)
        print(f"  {title.encode('ascii', 'ignore').decode()}")
        print("=" * 60)


def ask_yes_no(question: str, default: bool = True) -> bool:
    """询问是/否问题"""
    default_str = "Y/n" if default else "y/N"
    while True:
        response = input(f"{question} [{default_str}]: ").strip().lower()
        if response == "":
            return default
        if response in ["y", "yes"]:
            return True
        if response in ["n", "no"]:
            return False
        print("请输入 y 或 n")


def ask_int(question: str, default: int, min_val: int = 1, max_val: int = 100) -> int:
    """询问整数"""
    while True:
        response = input(f"{question} [{default}]: ").strip()
        if response == "":
            return default
        try:
            value = int(response)
            if min_val <= value <= max_val:
                return value
            print(f"请输入 {min_val} 到 {max_val} 之间的整数")
        except ValueError:
            print("请输入有效的整数")


def ask_float(question: str, default: float) -> float:
    """询问浮点数"""
    while True:
        response = input(f"{question} [{default}]: ").strip()
        if response == "":
            return default
        try:
            return float(response)
        except ValueError:
            print("请输入有效的数字")


def ask_string(question: str, default: str = "") -> str:
    """询问字符串"""
    response = input(f"{question} [{default}]: ").strip()
    return response if response else default


def configure_native_attributes() -> List[NativeAttribute]:
    """配置7个War3原生属性"""
    print_header("配置War3原生属性")
    print("请为7个War3原生属性配置自定义名称：")

    attributes = []

    # 预定义的7个原生属性
    native_definitions = [
        (1, "当前生命值"),
        (2, "当前魔法值"),
        (3, "力量"),
        (4, "智力"),
        (5, "敏捷"),
        (6, "最大生命值"),
        (7, "最大魔法值"),
    ]

    for attr_id, original_desc in native_definitions:
        print(f"\n--- 属性ID: {attr_id} (原War3属性: {original_desc}) ---")

        english_name = ask_string("英文常量名", f"ATTR_{original_desc.upper().replace(' ', '_')}")
        chinese_name = ask_string("中文名称", original_desc)

        attributes.append(NativeAttribute(
            id=attr_id,
            english_name=english_name,
            chinese_name=chinese_name,
            original_description=f"War3原生属性：{original_desc}"
        ))

    return attributes


def configure_custom_attributes(start_id: int) -> List[CustomAttribute]:
    """配置自定义属性列表"""
    print_header("配置自定义属性")

    attributes = []
    current_id = start_id

    while True:
        print(f"\n--- 自定义属性 #{len(attributes) + 1} (ID: {current_id}) ---")

        english_name = ask_string("英文常量名", f"ATTR_CUSTOM_{current_id}")
        chinese_name = ask_string("中文描述", "自定义属性")
        storage_type = ask_string("存储类型 (real/integer)", "real")
        description = ask_string("存储说明", "自定义属性值")

        attributes.append(CustomAttribute(
            id=current_id,
            english_name=english_name,
            chinese_name=chinese_name,
            storage_type=storage_type,
            description=description
        ))

        current_id += 1

        if not ask_yes_no("是否继续添加自定义属性？", True):
            break

    return attributes


def configure_attribute_limits(custom_attributes: List[CustomAttribute]) -> List[AttributeLimit]:
    """配置属性上限"""
    print_header("配置属性上限")

    if not custom_attributes:
        print("没有自定义属性，跳过上限配置")
        return []

    limits = []

    print("请为需要上限的属性配置最大值：")
    for attr in custom_attributes:
        if ask_yes_no(f"是否为属性 {attr.english_name} ({attr.chinese_name}) 设置上限？", False):
            max_value = ask_float("上限值", 100.0)
            description = ask_string("上限描述", f"{attr.chinese_name}上限 {max_value}")

            limits.append(AttributeLimit(
                attribute_name=attr.english_name,
                max_value=max_value,
                description=description
            ))

    return limits


def configure_default_values(native_attrs: List[NativeAttribute], custom_attrs: List[CustomAttribute]) -> Dict[str, float]:
    """配置默认值"""
    print_header("配置属性默认值")

    default_values = {}

    print("请为每个属性设置初始默认值：")

    # 原生属性默认值
    for attr in native_attrs:
        default_value = ask_float(f"{attr.chinese_name} ({attr.english_name}) 默认值", 0.0)
        default_values[attr.english_name] = default_value

    # 自定义属性默认值
    for attr in custom_attrs:
        default_value = ask_float(f"{attr.chinese_name} ({attr.english_name}) 默认值", 0.0)
        default_values[attr.english_name] = default_value

    return default_values


def interactive_configuration() -> SystemConfig:
    """交互式收集所有配置"""
    print_header("War3武侠地图英雄属性系统生成器")
    print("欢迎使用属性系统配置工具！")

    config = SystemConfig()

    # 选择配置模式
    print("\n请选择配置模式：")
    print("1. 全新配置")
    print("2. 加载现有配置")
    print("3. 使用默认配置")

    mode = ask_int("选择模式", 1, 1, 3)

    if mode == 2:
        # 加载配置
        config_files = list(Path("scripts/python/user_configs").glob("*.json"))
        if config_files:
            print("\n可用的配置文件：")
            for i, file in enumerate(config_files, 1):
                print(f"{i}. {file.name}")

            file_idx = ask_int("选择配置文件", 1, 1, len(config_files)) - 1
            config_path = config_files[file_idx]
            return load_config_from_json(str(config_path))
        else:
            print("没有找到配置文件，使用全新配置")
            mode = 1

    if mode == 3:
        # 使用默认配置
        return create_default_config()

    # 全新配置
    print_header("全新配置模式")

    # 配置原生属性
    config.native_attributes = configure_native_attributes()

    # 配置自定义属性起始ID
    config.custom_start_id = ask_int("自定义属性起始ID", 8, 8, 100)

    # 配置自定义属性
    config.custom_attributes = configure_custom_attributes(config.custom_start_id)

    # 配置属性上限
    config.attribute_limits = configure_attribute_limits(config.custom_attributes)

    # 配置默认值
    config.default_values = configure_default_values(config.native_attributes, config.custom_attributes)

    # 系统常量（使用默认值）
    config.system_constants = {
        "MODE_ADD": 0,
        "MODE_SUB": 1,
        "MODE_SET": 2,
    }

    return config


# ============================================================================
# 配置保存和加载
# ============================================================================

def save_config_to_json(config: SystemConfig, config_path: str):
    """将配置保存为JSON文件"""
    config_dict = {
        "native_attributes": [asdict(attr) for attr in config.native_attributes],
        "custom_attributes": [asdict(attr) for attr in config.custom_attributes],
        "attribute_limits": [asdict(limit) for limit in config.attribute_limits],
        "default_values": config.default_values,
        "custom_start_id": config.custom_start_id,
        "system_constants": config.system_constants,
    }

    with open(config_path, 'w', encoding='utf-8') as f:
        json.dump(config_dict, f, ensure_ascii=False, indent=2)

    print(f"配置已保存到: {config_path}")


def load_config_from_json(config_path: str) -> SystemConfig:
    """从JSON文件加载配置"""
    with open(config_path, 'r', encoding='utf-8') as f:
        config_dict = json.load(f)

    config = SystemConfig()

    # 加载原生属性
    for attr_dict in config_dict.get("native_attributes", []):
        config.native_attributes.append(NativeAttribute(**attr_dict))

    # 加载自定义属性
    for attr_dict in config_dict.get("custom_attributes", []):
        config.custom_attributes.append(CustomAttribute(**attr_dict))

    # 加载属性上限
    for limit_dict in config_dict.get("attribute_limits", []):
        config.attribute_limits.append(AttributeLimit(**limit_dict))

    # 加载其他配置
    config.default_values = config_dict.get("default_values", {})
    config.custom_start_id = config_dict.get("custom_start_id", 8)
    config.system_constants = config_dict.get("system_constants", {})

    print(f"配置已从 {config_path} 加载")
    return config


# ============================================================================
# 文件操作
# ============================================================================

def backup_original_file(template_path: str) -> str:
    """备份原模板文件，返回备份路径"""
    if not os.path.exists(template_path):
        raise FileNotFoundError(f"模板文件不存在: {template_path}")

    # 创建备份目录
    backup_dir = Path("scripts/python/backups")
    backup_dir.mkdir(parents=True, exist_ok=True)

    # 生成备份文件名
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_name = f"{Path(template_path).name}.backup_{timestamp}"
    backup_path = backup_dir / backup_name

    # 备份文件
    shutil.copy2(template_path, backup_path)
    print(f"原文件已备份到: {backup_path}")

    return str(backup_path)


def load_template_file(template_path: str) -> str:
    """读取模板文件内容"""
    with open(template_path, 'r', encoding='utf-8') as f:
        return f.read()


def save_generated_file(output_path: str, content: str):
    """保存生成的JASS文件"""
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"JASS文件已生成: {output_path}")


# ============================================================================
# JASS代码生成器
# ============================================================================

class JASSGenerator:
    """JASS代码生成器"""

    def __init__(self, template_path: str):
        self.template_path = template_path
        self.template_content = load_template_file(template_path)

    def generate(self, config: SystemConfig) -> str:
        """生成完整的JASS代码"""
        content = self.template_content

        # 替换所有标记
        content = self._replace_native_attributes(content, config.native_attributes)
        content = self._replace_custom_attributes(content, config.custom_attributes, config.custom_start_id)
        content = self._replace_attribute_limits(content, config.attribute_limits)
        content = self._replace_clamp_function(content, config.attribute_limits)
        content = self._replace_clamp_all_calls(content, config.attribute_limits)
        content = self._replace_convenience_functions(content, config.custom_attributes, config.attribute_limits)
        content = self._replace_default_values(content, config.default_values)

        return content

    def _replace_native_attributes(self, content: str, attributes: List[NativeAttribute]) -> str:
        """生成原生属性常量定义"""
        start_marker = TEMPLATE_MARKERS["NATIVE_ATTRIBUTES_START"]
        end_marker = TEMPLATE_MARKERS["NATIVE_ATTRIBUTES_END"]

        # 生成原生属性代码
        native_code = []
        for attr in attributes:
            line = f"        constant integer {attr.english_name} = {attr.id}   // {attr.chinese_name} ({attr.original_description})"
            native_code.append(line)

        # 替换标记之间的内容
        return self._replace_between_markers(content, start_marker, end_marker, "\n".join(native_code))

    def _replace_custom_attributes(self, content: str, attributes: List[CustomAttribute], custom_start_id: int) -> str:
        """生成自定义属性常量定义"""
        start_marker = TEMPLATE_MARKERS["CUSTOM_ATTRIBUTES_START"]
        end_marker = TEMPLATE_MARKERS["CUSTOM_ATTRIBUTES_END"]

        # 生成自定义属性代码
        custom_code = []

        # 添加起始ID定义
        custom_code.append(f"        constant integer ATTR_CUSTOM_START  = {custom_start_id}   // 自定义属性起始ID")
        custom_code.append("")

        # 添加自定义属性
        for attr in attributes:
            line = f"        constant integer {attr.english_name} = {attr.id}   // {attr.chinese_name} ({attr.description})"
            custom_code.append(line)

        # 添加注释提示
        if attributes:
            custom_code.append("")
            custom_code.append("        // 您可以根据需要继续添加更多属性")
            custom_code.append("        // constant integer ATTR_NEXT_ATTR    = 18  // 下一个属性")

        # 替换标记之间的内容
        content = self._replace_between_markers(content, start_marker, end_marker, "\n".join(custom_code))

        # 替换自定义起始ID标记
        content = content.replace(TEMPLATE_MARKERS["CUSTOM_START_ID"], str(custom_start_id))

        return content

    def _replace_attribute_limits(self, content: str, limits: List[AttributeLimit]) -> str:
        """生成属性上限常量定义"""
        start_marker = TEMPLATE_MARKERS["ATTRIBUTE_LIMITS_START"]
        end_marker = TEMPLATE_MARKERS["ATTRIBUTE_LIMITS_END"]

        # 生成属性上限代码
        limit_code = []
        for limit in limits:
            # 提取属性名（去掉ATTR_前缀）
            attr_name = limit.attribute_name.replace("ATTR_", "")
            line = f"        constant real MAX_{attr_name}         = {limit.max_value}   // {limit.description}"
            limit_code.append(line)

        # 替换标记之间的内容
        return self._replace_between_markers(content, start_marker, end_marker, "\n".join(limit_code))

    def _replace_clamp_function(self, content: str, limits: List[AttributeLimit]) -> str:
        """生成属性上限检查函数的case语句"""
        start_marker = TEMPLATE_MARKERS["CLAMP_FUNCTION_CASES_START"]
        end_marker = TEMPLATE_MARKERS["CLAMP_FUNCTION_CASES_END"]

        # 生成clamp函数case代码
        clamp_cases = []
        for i, limit in enumerate(limits):
            # 提取属性名（去掉ATTR_前缀）
            attr_name = limit.attribute_name.replace("ATTR_", "")

            if i == 0:
                # 第一个使用if
                case = f"        if attr_id == {limit.attribute_name} then\n            set clampedValue = RMinBJ(value, MAX_{attr_name})"
            else:
                # 后续使用elseif
                case = f"        elseif attr_id == {limit.attribute_name} then\n            set clampedValue = RMinBJ(value, MAX_{attr_name})"
            clamp_cases.append(case)

        # 如果没有上限配置，生成空的内容
        if not clamp_cases:
            clamp_code = ""
        else:
            clamp_code = "\n".join(clamp_cases) + "\n        endif"

        # 替换标记之间的内容
        return self._replace_between_markers(content, start_marker, end_marker, clamp_code)

    def _replace_clamp_all_calls(self, content: str, limits: List[AttributeLimit]) -> str:
        """生成ClampAll函数的调用列表"""
        start_marker = TEMPLATE_MARKERS["CLAMP_ALL_CALLS_START"]
        end_marker = TEMPLATE_MARKERS["CLAMP_ALL_CALLS_END"]

        # 生成调用代码
        calls = []
        for limit in limits:
            call = f"        call CustomHeroAttr_Clamp(hero, {limit.attribute_name})"
            calls.append(call)

        # 替换标记之间的内容
        return self._replace_between_markers(content, start_marker, end_marker, "\n".join(calls))

    def _replace_convenience_functions(self, content: str, attributes: List[CustomAttribute], attribute_limits: List[AttributeLimit]) -> str:
        """生成便捷函数"""
        start_marker = TEMPLATE_MARKERS["CONVENIENCE_FUNCTIONS_START"]
        end_marker = TEMPLATE_MARKERS["CONVENIENCE_FUNCTIONS_END"]

        # 生成便捷函数代码
        convenience_code = []
        for attr in attributes:
            # 提取函数名（去掉ATTR_前缀，转换为驼峰命名）
            func_name = attr.english_name.replace("ATTR_", "")
            func_name = ''.join(word.capitalize() for word in func_name.split('_'))

            # 生成获取函数
            get_func = f"    // 获取{attr.chinese_name}\n    function CustomHeroAttr_Get{func_name} takes unit hero returns real\n        return CustomHeroAttr_Get(hero, {attr.english_name})\n    endfunction\n"

            # 生成设置函数
            set_func = f"    // 设置{attr.chinese_name}\n    function CustomHeroAttr_Set{func_name} takes unit hero, real value returns nothing\n        call CustomHeroAttr_Set(hero, {attr.english_name}, value)"

            # 如果该属性有上限，添加clamp调用
            if any(limit.attribute_name == attr.english_name for limit in attribute_limits):
                set_func += f"\n        call CustomHeroAttr_Clamp(hero, {attr.english_name})"

            set_func += "\n    endfunction\n"

            convenience_code.append(get_func)
            convenience_code.append(set_func)

        # 替换标记之间的内容
        return self._replace_between_markers(content, start_marker, end_marker, "\n".join(convenience_code))

    def _replace_default_values(self, content: str, default_values: Dict[str, float]) -> str:
        """生成默认值初始化代码"""
        start_marker = TEMPLATE_MARKERS["DEFAULT_VALUES_START"]
        end_marker = TEMPLATE_MARKERS["DEFAULT_VALUES_END"]

        # 生成默认值代码
        default_code = []
        for attr_name, value in default_values.items():
            line = f"        call CustomHeroAttr_Set(hero, {attr_name}, {value})"
            default_code.append(line)

        # 替换标记之间的内容
        return self._replace_between_markers(content, start_marker, end_marker, "\n".join(default_code))

    def _replace_between_markers(self, content: str, start_marker: str, end_marker: str, new_content: str) -> str:
        """替换两个标记之间的内容（包括标记本身）"""
        start_idx = content.find(start_marker)
        end_idx = content.find(end_marker)

        if start_idx == -1 or end_idx == -1:
            print(f"警告: 未找到标记 {start_marker} 或 {end_marker}")
            return content

        # 计算结束标记后的位置
        end_idx += len(end_marker)

        # 构建新内容：替换标记及其之间的所有内容
        before = content[:start_idx]
        after = content[end_idx:]

        return before + new_content + after


# ============================================================================
# 主程序
# ============================================================================

def main():
    """主函数"""
    try:
        # 模板文件路径和输出文件路径
        template_path = "scripts/jass/core/01_custom_hero_attribute_system.j.template"
        output_path = "scripts/jass/core/01_custom_hero_attribute_system.j"

        # 交互式配置
        config = interactive_configuration()

        # 验证配置
        errors = validate_config(config)
        if errors:
            print_header("配置验证失败")
            for error in errors:
                print(f"  ✗ {error}")
            print("\n请修正配置后重试")
            return

        # 显示配置摘要
        print_header("配置摘要")
        print(f"原生属性: {len(config.native_attributes)} 个")
        print(f"自定义属性: {len(config.custom_attributes)} 个 (ID: {config.custom_start_id}-{config.custom_start_id + len(config.custom_attributes) - 1})")
        print(f"属性上限: {len(config.attribute_limits)} 个")
        print(f"默认值: {len(config.default_values)} 个")

        # 确认生成
        if not ask_yes_no("\n是否确认生成属性系统？", True):
            print("操作已取消")
            return

        # 备份原输出文件（如果存在）
        if os.path.exists(output_path):
            backup_path = backup_original_file(output_path)
        else:
            backup_path = None
            print("输出文件不存在，无需备份")

        # 生成JASS代码
        generator = JASSGenerator(template_path)
        generated_content = generator.generate(config)

        # 保存生成的JASS文件
        save_generated_file(output_path, generated_content)

        # 询问是否保存配置
        if ask_yes_no("是否保存当前配置供以后使用？", True):
            config_name = ask_string("配置名称", "my_attributes")
            config_path = f"scripts/python/user_configs/{config_name}.json"
            save_config_to_json(config, config_path)

        print_header("生成完成")
        print("属性系统已成功生成！")
        if backup_path:
            print(f"原文件备份在: {backup_path}")
        print(f"生成的JASS文件: {output_path}")
        print(f"模板文件: {template_path}")
        print("\n下一步：")
        print("1. 在 scripts/jass/main.j 中取消注释 #include \"core/01_custom_hero_attribute_system.j\"")
        print("2. 编译地图测试属性系统功能")

    except Exception as e:
        print(f"\n错误: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()