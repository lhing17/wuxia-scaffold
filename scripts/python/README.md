# War3武侠地图英雄属性系统生成器

## 概述

这是一个Python交互式脚本，用于生成自定义英雄属性系统的JASS文件。脚本基于现有的JASS模板 (`scripts/jass/core/01_custom_hero_attribute_system.j.template`) 和用户交互式提供的配置信息，自动生成完整的英雄属性系统代码。

## 功能特性

1. **交互式配置收集**：通过命令行交互收集用户定义的属性配置
2. **JASS代码生成**：基于用户配置直接修改原模板文件
3. **配置管理**：支持保存和加载JSON格式配置文件
4. **文件备份**：自动备份原模板文件，防止数据丢失
5. **配置验证**：验证用户输入的配置是否有效

## 快速开始

### 1. 运行脚本

```bash
cd /d/HL/wuxia-scaffold
python scripts/python/jass_attribute_generator.py
```

### 2. 选择配置模式

脚本启动后会显示以下选项：
- **1. 全新配置**：从头开始配置所有属性
- **2. 加载现有配置**：从保存的JSON配置文件加载
- **3. 使用默认配置**：使用预定义的默认配置

### 3. 配置属性系统

如果选择全新配置，将按以下步骤进行：

#### 步骤1：配置War3原生属性（7个属性）
- 为每个War3原生属性设置自定义名称
- 例如：将"当前生命值"重命名为"气血"

#### 步骤2：配置自定义属性
- 添加自定义属性（如攻击力、暴击率等）
- 设置属性ID、英文常量名、中文描述、存储类型

#### 步骤3：配置属性上限（可选）
- 为需要上限的属性设置最大值
- 例如：暴击率上限100%

#### 步骤4：配置默认值
- 为每个属性设置初始默认值

### 4. 生成代码

配置完成后，脚本将：
1. 自动备份原模板文件
2. 根据配置生成JASS代码
3. 更新模板文件
4. 询问是否保存配置供以后使用

## 配置文件

### 默认配置
- 位置：`scripts/python/config/default_config.json`
- 包含预定义的武侠主题属性配置

### 用户配置
- 保存位置：`scripts/python/user_configs/`
- 格式：JSON文件
- 可以保存多个配置，方便切换

### 备份文件
- 位置：`scripts/python/backups/`
- 每次生成前自动备份原文件
- 备份文件名包含时间戳：`01_custom_hero_attribute_system.j.backup_YYYYMMDD_HHMMSS`

## 使用示例

### 示例1：使用默认配置
```bash
python scripts/python/jass_attribute_generator.py
# 选择模式3（使用默认配置）
# 确认生成
```

### 示例2：加载现有配置
```bash
python scripts/python/jass_attribute_generator.py
# 选择模式2（加载现有配置）
# 选择配置文件
# 确认生成
```

### 示例3：全新配置
```bash
python scripts/python/jass_attribute_generator.py
# 选择模式1（全新配置）
# 按照提示逐步配置
# 保存配置为"my_attributes.json"
# 确认生成
```

## 配置项说明

### 1. War3原生属性（7个）
- 属性ID：1-7（固定）
- 需要配置：英文常量名、中文名称、原名称描述
- 示例：`ATTR_HEALTH = 1 // 气血 (War3原生属性：当前生命值)`

### 2. 自定义属性
- 属性ID：从自定义起始ID开始连续编号
- 需要配置：英文常量名、中文描述、存储类型、存储说明
- 存储类型：`real`（实数）或 `integer`（整数）
- 示例：`ATTR_ATTACK = 8 // 武力 (攻击力)`

### 3. 属性上限
- 可选配置
- 需要配置：属性名、上限值、描述
- 示例：`MAX_CRIT_RATE = 100.0 // 暴击率上限 100%`

### 4. 默认值
- 为每个属性设置初始值
- 示例：`ATTR_ATTACK = 20.0`

## 集成到地图

生成属性系统后，需要将其集成到地图中：

### 1. 启用属性系统
编辑 `scripts/jass/main.j` 文件，取消注释属性系统的引入：
```jass
// 取消注释以下行以启用自定义英雄属性系统
#include "core/01_custom_hero_attribute_system.j"
```

### 2. 编译地图
使用YDWE或其他War3地图编辑器编译地图，确保JASS代码语法正确。

### 3. 使用属性系统
在触发器中可以使用生成的属性函数：
```jass
// 获取英雄攻击力
local real attack = CustomHeroAttr_GetAttack(hero)

// 增加英雄攻击力
call CustomHeroAttr_AddAttack(hero, 10.0)

// 设置英雄暴击率
call CustomHeroAttr_SetCritRate(hero, 15.0)
```

## 注意事项

### 1. 属性ID连续性
- 原生属性ID必须为1-7
- 自定义属性ID必须从起始ID开始连续
- 脚本会自动验证ID连续性

### 2. 命名规范
- 英文常量名必须以`ATTR_`开头
- 建议使用大写字母和下划线
- 示例：`ATTR_ATTACK`, `ATTR_CRIT_RATE`

### 3. 存储类型
- 大多数属性使用`real`类型
- 只有需要整数的属性使用`integer`类型
- 示例：护甲值可以使用`integer`，暴击率使用`real`

### 4. 备份机制
- 每次生成前都会备份原文件
- 备份文件保存在`scripts/python/backups/`目录
- 如果需要恢复，可以手动复制备份文件

## 故障排除

### 1. Python脚本无法运行
- 确保已安装Python 3.8或更高版本
- 检查文件路径是否正确

### 2. 配置验证失败
- 检查属性ID是否连续
- 确保英文常量名以`ATTR_`开头
- 验证存储类型是否为`real`或`integer`

### 3. 生成的JASS代码有语法错误
- 检查模板文件中的标记是否正确
- 确保没有重复的属性ID
- 验证属性名是否符合JASS命名规范

### 4. 文件操作失败
- 检查文件权限
- 确保有足够的磁盘空间
- 验证文件路径是否存在

## 开发说明

### 项目结构
```
scripts/python/
├── jass_attribute_generator.py    # 主脚本
├── config/
│   └── default_config.json       # 默认配置
├── user_configs/                  # 用户保存的配置
├── backups/                       # 备份目录
└── README.md                     # 使用说明
```

### 模板标记系统
脚本使用标记系统识别和替换模板中的配置区域：
- `{{NATIVE_ATTRIBUTES_START}}` - `{{NATIVE_ATTRIBUTES_END}}`：原生属性定义
- `{{CUSTOM_ATTRIBUTES_START}}` - `{{CUSTOM_ATTRIBUTES_END}}`：自定义属性定义
- `{{ATTRIBUTE_LIMITS_START}}` - `{{ATTRIBUTE_LIMITS_END}}`：属性上限定义
- `{{CLAMP_FUNCTION_CASES_START}}` - `{{CLAMP_FUNCTION_CASES_END}}`：上限检查函数
- `{{CONVENIENCE_FUNCTIONS_START}}` - `{{CONVENIENCE_FUNCTIONS_END}}`：便捷函数
- `{{DEFAULT_VALUES_START}}` - `{{DEFAULT_VALUES_END}}`：默认值初始化
- `{{CUSTOM_START_ID}}`：自定义属性起始ID

### 扩展功能
如果需要扩展功能，可以修改以下部分：
1. **添加新的配置项**：在`SystemConfig`类中添加字段
2. **添加新的交互步骤**：在`interactive_configuration()`函数中添加
3. **添加新的模板标记**：在`TEMPLATE_MARKERS`和`JASSGenerator`类中添加
4. **修改验证规则**：在`validate_config()`函数中修改

## 许可证

本项目为War3武侠地图脚手架的一部分，遵循相同的许可证。

## 支持

如有问题或建议，请参考项目文档或联系开发者。