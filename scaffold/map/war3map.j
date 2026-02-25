globals
//globals from GameInit:
constant boolean LIBRARY_GameInit=true
//endglobals from GameInit
//globals from LBKKAPI:
constant boolean LIBRARY_LBKKAPI=true
string MOVE_TYPE_NONE= "none"
string MOVE_TYPE_FOOT= "foot"
string MOVE_TYPE_HORSE= "horse"
string MOVE_TYPE_FLY= "fly"
string MOVE_TYPE_HOVER= "hover"
string MOVE_TYPE_FLOAT= "float"
string MOVE_TYPE_AMPH= "amph"
string MOVE_TYPE_UNBUILD= "unbuild"
constant integer DEFENSE_TYPE_SMALL= 0
constant integer DEFENSE_TYPE_MEDIUM= 1
constant integer DEFENSE_TYPE_LARGE= 2
constant integer DEFENSE_TYPE_FORT= 3
constant integer DEFENSE_TYPE_NORMAL= 4
constant integer DEFENSE_TYPE_HERO= 5
constant integer DEFENSE_TYPE_DIVINE= 6
constant integer DEFENSE_TYPE_NONE= 7
integer array LBKKAPI___MonthDay
hashtable LBKKAPI___Hash=InitHashtable()
//endglobals from LBKKAPI
    // Generated
trigger gg_trg_firstOccur= null
trigger gg_trg_______u= null

trigger l__library_init

//JASSHelper struct globals:

endglobals
        native DzGetSelectedLeaderUnit takes nothing returns unit 
        native DzIsChatBoxOpen takes nothing returns boolean 
        native DzSetUnitPreselectUIVisible takes unit whichUnit, boolean visible returns nothing 
        native DzSetEffectAnimation takes effect whichEffect, integer index, integer flag returns nothing 
        native DzSetEffectPos takes effect whichEffect, real x, real y, real z returns nothing 
        native DzSetEffectVertexColor takes effect whichEffect, integer color returns nothing 
        native DzSetEffectVertexAlpha takes effect whichEffect, integer alpha returns nothing 
        native DzSetEffectModel takes effect whichEffect, string model returns nothing
        native DzSetEffectTeamColor takes effect whichHandle, integer playerId returns nothing
        native DzFrameSetClip takes integer whichframe, boolean enable returns nothing 
        native DzChangeWindowSize takes integer width, integer height returns boolean 
        native DzPlayEffectAnimation takes effect whichEffect, string anim, string link returns nothing 
        native DzBindEffect takes widget parent, string attachPoint, effect whichEffect returns nothing 
        native DzUnbindEffect takes effect whichEffect returns nothing 
        native DzSetWidgetSpriteScale takes widget whichUnit, real scale returns nothing 
        native DzSetEffectScale takes effect whichHandle, real scale returns nothing 
        native DzGetEffectVertexColor takes effect whichEffect returns integer 
        native DzGetEffectVertexAlpha takes effect whichEffect returns integer 
        native DzGetItemAbility takes item whichEffect, integer index returns ability 
        native DzFrameGetChildrenCount takes integer whichframe returns integer 
        native DzFrameGetChild takes integer whichframe, integer index returns integer 
        native DzUnlockBlpSizeLimit takes boolean enable returns nothing 
        native DzGetActivePatron takes unit store, player p returns unit 
        native DzGetLocalSelectUnitCount takes nothing returns integer 
        native DzGetLocalSelectUnit takes integer index returns unit 
        native DzGetJassStringTableCount takes nothing returns integer 
        native DzModelRemoveFromCache takes string path returns nothing 
        native DzModelRemoveAllFromCache takes nothing returns nothing 
        native DzFrameGetInfoPanelSelectButton takes integer index returns integer 
        native DzFrameGetInfoPanelBuffButton takes integer index returns integer 
        native DzFrameGetPeonBar takes nothing returns integer 
        native DzFrameGetCommandBarButtonNumberText takes integer whichframe returns integer 
        native DzFrameGetCommandBarButtonNumberOverlay takes integer whichframe returns integer 
        native DzFrameGetCommandBarButtonCooldownIndicator takes integer whichframe returns integer 
        native DzFrameGetCommandBarButtonAutoCastIndicator takes integer whichframe returns integer 
        native DzToggleFPS takes boolean show returns nothing 
        native DzGetFPS takes nothing returns integer 
        native DzFrameWorldToMinimapPosX takes real x, real y returns real 
        native DzFrameWorldToMinimapPosY takes real x, real y returns real 
        native DzWidgetSetMinimapIcon takes unit whichunit, string path returns nothing 
        native DzWidgetSetMinimapIconEnable takes unit whichunit, boolean enable returns nothing 
        native DzFrameGetWorldFrameMessage takes nothing returns integer 
        native DzSimpleMessageFrameAddMessage takes integer whichframe, string text, integer color, real duration, boolean permanent returns nothing 
        native DzSimpleMessageFrameClear takes integer whichframe returns nothing 
        native DzConvertScreenPositionX takes real x, real y returns real 
        native DzConvertScreenPositionY takes real x, real y returns real 
        native DzRegisterOnBuildLocal takes code func returns nothing 
        native DzGetOnBuildOrderId takes nothing returns integer 
        native DzGetOnBuildOrderType takes nothing returns integer 
        native DzGetOnBuildAgent takes nothing returns widget 
        native DzRegisterOnTargetLocal takes code func returns nothing 
        native DzGetOnTargetAbilId takes nothing returns integer 
        native DzGetOnTargetOrderId takes nothing returns integer 
        native DzGetOnTargetOrderType takes nothing returns integer 
        native DzGetOnTargetAgent takes nothing returns widget 
        native DzGetOnTargetInstantTarget takes nothing returns widget 
        native DzOpenQQGroupUrl takes string url returns boolean 
        native DzFrameEnableClipRect takes boolean enable returns nothing 
        native DzSetUnitName takes unit whichUnit, string name returns nothing 
        native DzSetUnitPortrait takes unit whichUnit, string modelFile returns nothing 
        native DzSetUnitDescription takes unit whichUnit, string value returns nothing 
        native DzSetUnitMissileArc takes unit whichUnit, real arc returns nothing 
        native DzSetUnitMissileModel takes unit whichUnit, string modelFile returns nothing 
        native DzSetUnitProperName takes unit whichUnit, string name returns nothing 
        native DzSetUnitMissileHoming takes unit whichUnit, boolean enable returns nothing 
        native DzSetUnitMissileSpeed takes unit whichUnit, real speed returns nothing 
        native DzSetEffectVisible takes effect whichHandle, boolean enable returns nothing 
        native DzReviveUnit takes unit whichUnit, player whichPlayer, real hp, real mp, real x, real y returns nothing 
        native DzGetAttackAbility takes unit whichUnit returns ability 
        native DzAttackAbilityEndCooldown takes ability whichHandle returns nothing 
        native EXSetUnitArrayString takes integer uid, integer id, integer n, string name returns boolean 
        native EXSetUnitInteger takes integer uid, integer id, integer n returns boolean 
        native DzDoodadCreate takes integer id, integer var, real x, real y, real z, real rotate, real scale returns integer 
        native DzDoodadGetTypeId takes integer doodad returns integer 
        native DzDoodadSetModel takes integer doodad, string modelFile returns nothing 
        native DzDoodadSetTeamColor takes integer doodad, integer color returns nothing 
        native DzDoodadSetColor takes integer doodad, integer color returns nothing 
        native DzDoodadGetX takes integer doodad returns real 
        native DzDoodadGetY takes integer doodad returns real 
        native DzDoodadGetZ takes integer doodad returns real 
        native DzDoodadSetPosition takes integer doodad, real x, real y, real z returns nothing 
        native DzDoodadSetOrientMatrixRotate takes integer doodad, real angle, real axisX, real axisY, real axisZ returns nothing 
        native DzDoodadSetOrientMatrixScale takes integer doodad, real x, real y, real z returns nothing 
        native DzDoodadSetOrientMatrixResize takes integer doodad returns nothing 
        native DzDoodadSetVisible takes integer doodad, boolean enable returns nothing 
        native DzDoodadSetAnimation takes integer doodad, string animName, boolean animRandom returns nothing 
        native DzDoodadSetTimeScale takes integer doodad, real scale returns nothing 
        native DzDoodadGetTimeScale takes integer doodad returns real 
        native DzDoodadGetCurrentAnimationIndex takes integer doodad returns integer 
        native DzDoodadGetAnimationCount takes integer doodad returns integer 
        native DzDoodadGetAnimationName takes integer doodad, integer index returns string 
        native DzDoodadGetAnimationTime takes integer doodad, integer index returns integer 
        native DzUnlockOpCodeLimit takes boolean enable returns nothing
        native DzSetClipboard takes string content returns boolean
        native DzDoodadRemove takes integer doodad returns nothing
        native DzRemovePlayerTechResearched takes player whichPlayer, integer techid, integer removelevels returns nothing
        native DzUnitFindAbility takes unit whichUnit, integer abilcode returns ability
        native DzAbilitySetStringData takes ability whichAbility, string key, string value returns nothing
        native DzAbilitySetEnable takes ability whichAbility, boolean enable, boolean hideUI returns nothing
        native DzUnitSetMoveType takes unit whichUnit, string moveType returns nothing
        native DzFrameGetWidth takes integer frame returns real
        native DzFrameSetAnimateByIndex takes integer frame, integer index, integer flag returns nothing
        native DzSetUnitDataCacheInteger takes integer uid, integer id,integer index,integer v returns nothing
        native DzUnitUIAddLevelArrayInteger takes integer uid, integer id,integer lv,integer v returns nothing
        native DzItemSetModel takes item whichItem, string file returns nothing
        native DzItemSetVertexColor takes item whichItem, integer color returns nothing
        native DzItemSetAlpha takes item whichItem, integer color returns nothing
        native DzItemSetPortrait takes item whichItem, string modelPath returns nothing
	native DzFrameHookHpBar takes code func returns nothing
	native DzFrameGetTriggerHpBarUnit takes nothing returns unit
	native DzFrameGetTriggerHpBar takes nothing returns integer
	native DzFrameGetUnitHpBar takes unit whichUnit returns integer
        native DzGetCursorFrame takes nothing returns integer
        native DzFrameGetPointValid takes integer frame, integer anchor returns boolean
        native DzFrameGetPointRelative takes integer frame, integer anchor returns integer
        native DzFrameGetPointRelativePoint takes integer frame, integer anchor returns integer
        native DzFrameGetPointX takes integer frame, integer anchor returns real
        native DzFrameGetPointY takes integer frame, integer anchor returns real
        native DzWriteLog takes string msg returns nothing
        native DzTextTagGetFont takes nothing returns string
        native DzTextTagSetFont takes string fileName returns nothing
        native DzTextTagSetStartAlpha takes texttag t, integer alpha returns nothing
        native DzTextTagGetShadowColor takes texttag t returns integer
        native DzTextTagSetShadowColor takes texttag t, integer color returns nothing
        native DzGroupGetCount takes group g returns integer
        native DzGroupGetUnitAt takes group g, integer index returns unit
        native DzUnitCreateIllusion takes player p, integer unitId, real x, real y, real face returns unit
        native DzUnitCreateIllusionFromUnit takes unit u returns unit
        native DzStringContains takes string s, string whichString, boolean caseSensitive returns boolean
        native DzStringFind takes string s, string whichString, integer off, boolean caseSensitive returns integer
        native DzStringFindFirstOf takes string s, string whichString, integer off, boolean caseSensitive returns integer
        native DzStringFindFirstNotOf takes string s, string whichString, integer off, boolean caseSensitive returns integer
        native DzStringFindLastOf takes string s, string whichString, integer off, boolean caseSensitive returns integer
        native DzStringFindLastNotOf takes string s, string whichString, integer off, boolean caseSensitive returns integer
        native DzStringTrimLeft takes string s returns string
        native DzStringTrimRight takes string s returns string
        native DzStringTrim takes string s returns string
        native DzStringReverse takes string s returns string
        native DzStringReplace takes string s, string whichString, string replaceWith, boolean caseSensitive returns string
        native DzStringInsert takes string s, integer whichPosition, string whichString returns string
        native DzBitGet takes integer i, integer byteIndex returns integer
        native DzBitSet takes integer i, integer byteIndex, integer byteValue returns integer
        native DzBitGetByte takes integer i, integer byteIndex returns integer
        native DzBitSetByte takes integer i, integer byteIndex, integer byteValue returns integer
        native DzBitNot takes integer i returns integer
        native DzBitAnd takes integer a, integer b returns integer
        native DzBitOr takes integer a, integer b returns integer
        native DzBitXor takes integer a, integer b returns integer
        native DzBitShiftLeft takes integer i, integer bitsToShift returns integer
        native DzBitShiftRight takes integer i, integer bitsToShift returns integer
        native DzBitToInt takes integer b1, integer b2, integer b3, integer b4 returns integer
        native DzQueueGroupImmediateOrderById takes group whichGroup, integer order returns boolean
        native DzQueueGroupPointOrderById takes group whichGroup, integer order, real x, real y returns boolean
        native DzQueueGroupTargetOrderById takes group whichGroup, integer order, widget targetWidget returns boolean
        native DzQueueIssueImmediateOrderById takes unit whichUnit, integer order returns boolean
        native DzQueueIssuePointOrderById takes unit whichUnit, integer order, real x, real y returns boolean
        native DzQueueIssueTargetOrderById takes unit whichUnit, integer order, widget targetWidget returns boolean
        native DzQueueIssueInstantPointOrderById takes unit whichUnit, integer order, real x, real y, widget instantTargetWidget returns boolean
        native DzQueueIssueInstantTargetOrderById takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
        native DzQueueIssueBuildOrderById takes unit whichPeon, integer unitId, real x, real y returns boolean
        native DzQueueIssueNeutralImmediateOrderById takes player forWhichPlayer,unit neutralStructure, integer unitId returns boolean
        native DzQueueIssueNeutralPointOrderById takes player forWhichPlayer,unit neutralStructure, integer unitId, real x, real y returns boolean
        native DzQueueIssueNeutralTargetOrderById takes player forWhichPlayer,unit neutralStructure, integer unitId, widget target returns boolean
        native DzUnitOrdersCount takes unit u returns integer
        native DzUnitOrdersClear takes unit u, boolean onlyQueued returns nothing
        native DzUnitOrdersExec takes unit u returns nothing
        native DzUnitOrdersForceStop takes unit u, boolean clearQueue returns nothing
        native DzUnitOrdersReverse takes unit u returns nothing
        native DzXlsxOpen takes string filePath returns integer
        native DzXlsxClose takes integer docHandle returns boolean
        native DzXlsxWorksheetGetRowCount takes integer docHandle, string sheetName returns integer
        native DzXlsxWorksheetGetColumnCount takes integer docHandle, string sheetName returns integer
        native DzXlsxWorksheetGetCellType takes integer docHandle, string sheetName, integer row, integer column returns integer
        native DzXlsxWorksheetGetCellString takes integer docHandle, string sheetName, integer row, integer column returns string
        native DzXlsxWorksheetGetCellInteger takes integer docHandle, string sheetName, integer row, integer column returns integer
        native DzXlsxWorksheetGetCellBoolean takes integer docHandle, string sheetName, integer row, integer column returns boolean
        native DzXlsxWorksheetGetCellFloat takes integer docHandle, string sheetName, integer row, integer column returns real
        native DzFrameSetTexCoord takes integer frame, real left, real top, real right, real bottom returns nothing
        native DzSetUnitAbilityRange takes unit Unit, integer abil_code, real value returns boolean
        native DzGetUnitAbilityRange takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityArea takes unit Unit, integer abil_code, real value returns boolean
        native DzGetUnitAbilityArea takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityCool takes unit Unit, integer abil_code, real cool, real max_cool returns boolean
        native DzGetUnitAbilityCool takes unit Unit, integer abil_code returns real
        native DzGetUnitAbilityMaxCool takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityDataA takes unit Unit, integer abil_code, real value returns boolean
        native DzGetUnitAbilityDataA takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityDataB takes unit Unit, integer abil_code, real value returns boolean
        native DzGetUnitAbilityDataB takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityDataC takes unit Unit, integer abil_code, real value returns boolean
        native DzGetUnitAbilityDataC takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityDataD takes unit Unit, integer abil_code, real value returns boolean
        native DzGetUnitAbilityDataD takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityDataE takes unit Unit, integer abil_code, real value returns boolean
        native DzGetUnitAbilityDataE takes unit Unit, integer abil_code returns real
        native DzSetUnitAbilityButtonPos takes unit Unit, integer abil_code, integer x, integer y returns boolean
        native DzSetUnitAbilityHotkey takes unit Unit, integer abil_code, string key returns boolean
        native DzConvertTargs2Str takes integer targs returns string 
        native DzConvertStr2Targs takes string targs returns integer 
        native DzSetUnitAbilityTargs takes unit Unit, integer abil_code, integer value returns boolean
        native DzGetUnitAbilityTargs takes unit Unit, integer abil_code returns integer
        native DzSetUnitAbilityCost takes unit Unit, integer abil_code, integer value returns boolean
        native DzGetUnitAbilityCost takes unit Unit, integer abil_code returns integer
        native DzSetUnitAbilityReqLevel takes unit Unit, integer abil_code, integer value returns boolean
        native DzGetUnitAbilityReqLevel takes unit Unit, integer abil_code returns integer
        native DzSetUnitAbilityUnitId takes unit Unit, integer abil_code, integer value returns boolean
        native DzGetUnitAbilityUnitId takes unit Unit, integer abil_code returns integer
        native DzSetUnitAbilityBuildOrderId takes unit Unit, integer abil_code, integer value returns boolean
        native DzGetUnitAbilityBuildOrderId takes unit Unit, integer abil_code returns integer
        native DzSetUnitAbilityBuildModel takes unit Unit, integer abil_code, string model_path, real model_scale returns boolean 
        native DzUnitHasAbility takes unit Unit, integer abil_code returns boolean 
        native KKCreateCommandButton takes nothing returns integer 
        native KKDestroyCommandButton takes integer btn returns nothing 
        native KKCommandButtonClick takes integer btn, integer mouse_type returns nothing
        native KKCommandTargetClick takes integer mouse_type, widget target returns boolean 
        native KKCommandTerrainClick takes integer mouse_type, real x, real y, real z returns boolean 
        native KKSetCommandUnitAbility takes integer btn, unit Unit, integer abil_code returns nothing 
        native DzItemGetVertexColor takes item Item returns integer 
        native DzItemSetSize takes item Item, real size returns nothing 
        native DzItemGetSize takes item Item returns real 
        native DzItemMatRotateX takes item Item, real x returns nothing
        native DzItemMatRotateY takes item Item, real y returns nothing
        native DzItemMatRotateZ takes item Item, real z returns nothing
        native DzItemMatScale takes item Item, real x, real y, real z returns nothing
        native DzItemMatReset takes item Item returns nothing 
        native DzGetLastSelectedItem takes nothing returns item 
        native DzSetPariticle2Size takes agent Widget, real scale returns nothing 
        native DzSetUnitCollisionSize takes unit Unit, real size returns nothing 
        native DzGetUnitCollisionSize takes unit Unit returns real 
        native DzSetWidgetTexture takes agent Handle, string TexturePath, integer ReplaceId returns nothing 
        native DzSetUnitSelectScale takes unit Unit, real scale returns nothing 
        native DzSetUnitHitIgnore takes unit Unit, boolean ignore returns nothing 
        native DzEffectBindEffect takes agent Handle, string AttachName, effect eff returns nothing
        native DzFrameSetIgnoreTrackEvents takes integer frame, boolean ignore returns nothing 
        native DzFrameAddModel takes integer parent_frame returns integer 
        native DzFrameSetModel2 takes integer model_frame, string model_file, integer team_color_id returns nothing 
        native DzFrameAddModelEffect takes integer model_frame, string attach_point, string model_file returns integer 
        native DzFrameRemoveModelEffect takes integer model_frame, integer effect_frame returns nothing 
        native DzFrameSetModelAnimationByIndex takes integer model_frame, integer anim_index returns nothing 
        native DzFrameSetModelAnimation takes integer model_frame, string animation returns nothing 
        native DzFrameSetModelCameraSource takes integer model_frame, real x, real y, real z returns nothing 
        native DzFrameSetModelCameraTarget takes integer model_frame, real x, real y, real z returns nothing 
        native DzFrameSetModelSize takes integer model_frame, real size returns nothing 
        native DzFrameGetModelSize takes integer model_frame returns real 
        native DzFrameSetModelPosition takes integer model_frame, real x, real y, real z returns nothing
        native DzFrameSetModelX takes integer model_frame, real x returns nothing 
        native DzFrameGetModelX takes integer model_frame returns real 
        native DzFrameSetModelY takes integer model_frame, real y returns nothing 
        native DzFrameGetModelY takes integer model_frame returns real 
        native DzFrameSetModelZ takes integer model_frame, real z returns nothing 
        native DzFrameGetModelZ takes integer model_frame returns real 
        native DzFrameSetModelSpeed takes integer model_frame, real speed returns nothing 
        native DzFrameGetModelSpeed takes integer model_frame returns real 
        native DzFrameSetModelScale takes integer model_frame, real x, real y, real z returns nothing 
        native DzFrameSetModelMatReset takes integer model_frame returns nothing 
        native DzFrameSetModelRotateX takes integer model_frame, real x returns nothing 
        native DzFrameSetModelRotateY takes integer model_frame, real y returns nothing 
        native DzFrameSetModelRotateZ takes integer model_frame, real z returns nothing 
        native DzFrameSetModelColor takes integer model_frame, integer color returns nothing 
        native DzFrameGetModelColor takes integer model_frame returns integer
        native DzFrameSetModelTexture takes integer model_frame, string texture_file, integer replace_texutre_id returns nothing 
        native DzFrameSetModelParticle2Size takes integer model_frame, real scale returns nothing 
        native DzGetGlueUI takes nothing returns integer 
        native DzFrameGetMouse takes nothing returns integer 
        native DzFrameGetContext takes integer frame returns integer 
        native DzFrameGetName takes integer frame returns string 
        native DzFrameSetNameContext takes integer frame, string name, integer context returns nothing 
        native DzFrameSetTextFontSpacing takes integer text_frame, real spacing returns nothing 
        native KKCommandGetCooldownModel takes integer cmd_btn returns integer 
        native KKCommandSetCooldownModelSize takes integer cmd_btn, real size returns nothing 
        native KKCommandSetCooldownModelSize2 takes integer cmd_btn, real width, real height returns nothing 
        native DzGetPlayerLastSelectedItem takes player p returns item 
        native DzGetCacheModelCount takes nothing returns integer 
        native DzSetMaxFps takes integer max_fps returns nothing 
        native DzEnableDrawSkillPanel takes unit u, boolean is_enable returns nothing 
        native DzEnableDrawSkillPanelByPlayer takes player p, boolean is_enable returns nothing 
        native DzSetEffectFogVisible takes effect eff, boolean is_visible returns nothing 
        native DzSetEffectMaskVisible takes effect eff, boolean is_visible returns nothing 
        native DzFrameBindWidget takes integer frame, widget u, real world_x, real world_y, real world_z, real screen_x, real screen_y, boolean fog_visible, boolean unit_visible, boolean dead_visible returns nothing 
        native DzFrameBindWorldPos takes integer frame, real world_x, real world_y, real world_z, real screen_x, real screen_y, boolean fog_visible returns nothing
        native DzFrameUnBind takes integer frame returns nothing 
        native DzDisableUnitPreselectUi takes nothing returns nothing
        native DzDisableItemPreselectUi takes nothing returns nothing
        native DzFrameGetLowerLevelFrame takes nothing returns integer 
        native DzFrameSetCheckBoxState takes integer check_box_frame, boolean checked returns nothing
        native DzFrameGetCheckBoxState takes integer check_box_frame returns boolean
        native DzFrameIsFocus takes integer frame returns boolean 
        native DzFrameSetEditBoxActive takes integer frame, boolean is_active returns nothing 
        native DzFrameSetEditBoxDisableIme takes integer frame, boolean is_disable returns nothing 
        native DzIsWindowMode takes nothing returns boolean 
        native DzIsWindowActive takes nothing returns boolean
        native DzWindowSetPoint takes integer x, integer y returns nothing 
        native DzWindowSetSize takes integer width, integer height returns nothing 
        native DzGetSystemMetricsWidth takes nothing returns integer 
        native DzGetSystemMetricsHeight takes nothing returns integer 
        native DzGetDoodadsCount takes nothing returns integer 
        native DzSetDoodadsMatScale takes integer doodads_index, real x, real y, real z returns nothing 
        native DzSetDoodadsMatRotateX takes integer doodads_index, real x returns nothing 
        native DzSetDoodadsMatRotateY takes integer doodads_index, real y returns nothing 
        native DzSetDoodadsMatRotateZ takes integer doodads_index, real z returns nothing 
        native DzSetDoodadsMatReset takes integer doodads_index returns nothing 
        native DzSetUnitAbilityArt takes unit u, integer abil_id, string art_path returns boolean
        native DzGetUnitAbilityArt takes unit u, integer abil_id returns string
        native DzSetUnitAbilityTip takes unit u, integer abil_id, string tip returns boolean
        native DzGetUnitAbilityTip takes unit u, integer abil_id returns string
        native DzSetUnitAbilityUberTip takes unit u, integer abil_id, string ubertip returns boolean
        native DzGetUnitAbilityUberTip takes unit u, integer abil_id returns string
        native DzSetUnitAbilityUpdate takes unit u, integer abil_id returns boolean 
        native DzSetUnitAbilityOrderId takes unit u, integer abil_id, integer order_id returns boolean
        native DzGetUnitAbilityOrderId takes unit u, integer abil_id returns integer
        native DzSetUnitAbilitySpellBookList takes unit u, integer abil_id, string abil_list, boolean save_cooldown returns boolean 
        native DzGetUnitAbilitySpellBookList takes unit u, integer abil_id returns string 
        native DzSetUnitAbilityMissileArt takes unit u, integer abil_id, string missile_art returns boolean
        native DzGetUnitAbilityMissileArt takes unit u, integer abil_id returns string
        native DzSetUnitAbilityMissileSpeed takes unit u, integer abil_id, real missile_speed returns boolean
        native DzGetUnitAbilityMissileSpeed takes unit u, integer abil_id returns real
        native DzSetUnitAbilityMissileArc takes unit u, integer abil_id, real missile_arc returns boolean
        native DzGetUnitAbilityMissileArc takes unit u, integer abil_id returns real
        native DzSetUnitAbilityMissileHoming takes unit u, integer abil_id, boolean missile_homing returns boolean
        native DzGetUnitAbilityMissileHoming takes unit u, integer abil_id returns boolean
        native DzSetUnitAbilityMissileCount takes unit u, integer abil_id, integer missile_count returns boolean
        native DzGetUnitAbilityMissileCount takes unit u, integer abil_id returns integer
        native DzSetUnitAbilityMissileDamage takes unit u, integer abil_id, real damage, real max_damage, attacktype atktp, damagetype dmgtp returns boolean
        native DzGetUnitAbilityMissileDamage takes unit u, integer abil_id returns real
        native DzGetUnitAbilityMissileMaxDamage takes unit u, integer abil_id returns real


//library GameInit:
    function OnInit takes nothing returns nothing
        // 解锁字节码限制
        call DzUnlockOpCodeLimit(true)
        // 以下初始化其他系统
    endfunction

//library GameInit ends
//library LBKKAPI:












































        //转换屏幕坐标到世界坐标  


        //监听建筑选位置  

        //等于0时是结束事件  



        //监听技能选目标  

        //等于0时是结束事件  





        // 打开QQ群链接  
















        function DzSetHeroTypeProperName takes integer uid,string name returns nothing
                call EXSetUnitArrayString(uid, 61, 0, name)
                call EXSetUnitInteger(uid, 61, 1)
        endfunction 
        function DzSetUnitTypeName takes integer uid,string name returns nothing
                call EXSetUnitArrayString(uid, 10, 0, name)
                call EXSetUnitInteger(uid, 10, 1)
        endfunction 
        function DzIsUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns boolean
                return ConvertAttackType(R2I(GetUnitState(whichUnit, ConvertUnitState(16 + 19 * index)))) == attackType
        endfunction 
        function DzSetUnitAttackType takes unit whichUnit,integer index,attacktype attackType returns nothing
                call SetUnitState(whichUnit, ConvertUnitState(16 + 19 * index), GetHandleId(attackType))
        endfunction 
        function DzIsUnitDefenseType takes unit whichUnit,integer defenseType returns boolean
                return R2I(GetUnitState(whichUnit, ConvertUnitState(0x50))) == defenseType
        endfunction 
        function DzSetUnitDefenseType takes unit whichUnit,integer defenseType returns nothing
                call SetUnitState(whichUnit, ConvertUnitState(0x50), defenseType)
        endfunction 
        // 地形装饰物




















        // 解锁JASS字节码限制

        // 设置剪切板内容

        //删除装饰物

        //移除科技等级

        
        // 查找单位技能

        // 修改技能数据-字符串

                
        // 启用/禁用技能

        // 设置单位移动类型

        // 获取控件宽度




        function KKWESetUnitDataCacheInteger takes integer uid,integer id,integer v returns nothing
                call DzSetUnitDataCacheInteger(uid, id, 0, v)
        endfunction
        function KKWEUnitUIAddUpgradesIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 94, id, v)
        endfunction
        function KKWEUnitUIAddBuildsIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 100, id, v)
        endfunction
        function KKWEUnitUIAddResearchesIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 112, id, v)
        endfunction
        function KKWEUnitUIAddTrainsIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 106, id, v)
        endfunction
        function KKWEUnitUIAddSellsUnitIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 118, id, v)
        endfunction
        function KKWEUnitUIAddSellsItemIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 124, id, v)
        endfunction
        function KKWEUnitUIAddMakesItemIds takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 130, id, v)
        endfunction
        function KKWEUnitUIAddRequiresUnitCode takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 166, id, v)
        endfunction
        function KKWEUnitUIAddRequiresTechcode takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 166, id, v)
        endfunction
        function KKWEUnitUIAddRequiresAmounts takes integer uid,integer id,integer v returns nothing
                call DzUnitUIAddLevelArrayInteger(uid, 172, id, v)
        endfunction
         // 设置道具模型

        // 设置道具颜色

        // 设置道具透明度

        // 设置道具头像











                
        function DzIsLeapYear takes integer year returns boolean
                return ( ModuloInteger(year, 4) == 0 and ModuloInteger(year, 100) != 0 ) or ( ModuloInteger(year, 400) == 0 )
        endfunction
        function DzGetTimeDateFromTimestamp takes integer timestamp returns string
                local integer totalSeconds= timestamp + 28800
                local integer days= 0
                local integer day= 0
                local integer secondsInDay= 86400
                local integer remainingSeconds= ModuloInteger(totalSeconds, secondsInDay)
                local integer year= 1970
                local integer totalDays= ( totalSeconds + 86399 ) / ( secondsInDay )
                local integer num= 0
                local integer month=0
                local integer hour
                local integer minute
                local integer second
                local string str
                loop
                if DzIsLeapYear(year) then
                        set num=num + 366
                else
                        set num=num + 365
                endif
                if num > totalDays then
                        set totalDays=totalDays - days
                        exitwhen true
                else
                        set days=num
                endif
                set year=year + 1
                endloop
                set month=1
                set num=0
                set days=0
                if ( DzIsLeapYear(year) ) then
                loop
                        set num=num + LBKKAPI___MonthDay[100 + month]
                        if num >= totalDays then
                        set day=totalDays - days
                        exitwhen true
                        else
                        set days=num
                        endif
                        set month=month + 1
                endloop
                else
                loop
                        set num=num + LBKKAPI___MonthDay[month]
                        if num >= totalDays then
                        set day=totalDays - days
                        exitwhen true
                        else
                        set days=num
                        endif
                        set month=month + 1
                endloop
                endif
                if ( day == 0 ) then
                set day=1
                endif
                set hour=remainingSeconds / 3600
                set remainingSeconds=ModuloInteger(remainingSeconds, 3600)
                set minute=remainingSeconds / 60
                set second=ModuloInteger(remainingSeconds, 60)
                set str=I2S(year) + "-" + I2S(month) + "-" + I2S(day) + " " + I2S(hour) + ":" + I2S(minute) + ":" + I2S(second)
                call SaveInteger(LBKKAPI___Hash, timestamp, 1, year)
                call SaveInteger(LBKKAPI___Hash, timestamp, 2, month)
                call SaveInteger(LBKKAPI___Hash, timestamp, 3, day)
                call SaveStr(LBKKAPI___Hash, timestamp, 4, str)
                return str
        endfunction
        function KKAPIGetTimeDateFromTimestamp takes integer timestamp returns string
                set timestamp=IMaxBJ(timestamp, 0)
                if ( HaveSavedString(LBKKAPI___Hash, timestamp, 4) ) then
                        return LoadStr(LBKKAPI___Hash, timestamp, 4)
                else
                        return DzGetTimeDateFromTimestamp(timestamp)
                endif
        endfunction
        function KKAPIGetTimestampYear takes integer timestamp returns integer
                set timestamp=IMaxBJ(timestamp, 0)
                if ( HaveSavedInteger(LBKKAPI___Hash, timestamp, 1) == false ) then
                        call DzGetTimeDateFromTimestamp(timestamp)
                endif
                 return LoadInteger(LBKKAPI___Hash, timestamp, 1)
        endfunction
        function KKAPIGetTimestampMonth takes integer timestamp returns integer
                set timestamp=IMaxBJ(timestamp, 0)
                if ( HaveSavedInteger(LBKKAPI___Hash, timestamp, 2) == false ) then
                        call DzGetTimeDateFromTimestamp(timestamp)
                endif
                 return LoadInteger(LBKKAPI___Hash, timestamp, 2)
        endfunction
        function KKAPIGetTimestampDay takes integer timestamp returns integer
                set timestamp=IMaxBJ(timestamp, 0)
                if ( HaveSavedInteger(LBKKAPI___Hash, timestamp, 3) == false ) then
                        call DzGetTimeDateFromTimestamp(timestamp)
                endif
                 return LoadInteger(LBKKAPI___Hash, timestamp, 3)
        endfunction
        function LBKKAPI___Init takes nothing returns nothing
                set LBKKAPI___MonthDay[1]=31
                set LBKKAPI___MonthDay[2]=28
                set LBKKAPI___MonthDay[3]=31
                set LBKKAPI___MonthDay[4]=30
                set LBKKAPI___MonthDay[5]=31
                set LBKKAPI___MonthDay[6]=30
                set LBKKAPI___MonthDay[7]=31
                set LBKKAPI___MonthDay[8]=31
                set LBKKAPI___MonthDay[9]=30
                set LBKKAPI___MonthDay[10]=31
                set LBKKAPI___MonthDay[11]=30
                set LBKKAPI___MonthDay[12]=31
                set LBKKAPI___MonthDay[101]=31
                set LBKKAPI___MonthDay[102]=29
                set LBKKAPI___MonthDay[103]=31
                set LBKKAPI___MonthDay[104]=30
                set LBKKAPI___MonthDay[105]=31
                set LBKKAPI___MonthDay[106]=30
                set LBKKAPI___MonthDay[107]=31
                set LBKKAPI___MonthDay[108]=31
                set LBKKAPI___MonthDay[109]=30
                set LBKKAPI___MonthDay[110]=31
                set LBKKAPI___MonthDay[111]=30
                set LBKKAPI___MonthDay[112]=31
        endfunction

        // texttag





    
        // group


    
        // unit


    
        // string












    
        // bit











    
        // issue

















        // xlsx









    




























        




        


        
        















        







        function KKConvertInt2AbilId takes integer i returns integer
                return i
        endfunction
        function KKConvertAbilId2Int takes integer i returns integer
                return i
        endfunction
        function KKConvertInt2Color takes integer i returns integer
                return i
        endfunction
        function KKConvertColor2Int takes integer i returns integer
                return i
        endfunction









































        
                







        function KKFrameBindItem takes integer frame,widget u,real world_x,real world_y,real world_z,real screen_x,real screen_y,boolean fog_visible,boolean item_visible returns nothing
                call DzFrameBindWidget(frame, u, world_x, world_y, world_z, screen_x, screen_y, fog_visible, item_visible, false)
        endfunction




















           
























        

//library LBKKAPI ends
//===========================================================================
// 
// 武侠脚手架
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Wed Feb 25 09:58:35 2026
//   Map Author: zei_kale
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: firstOccur
//===========================================================================
function Trig_firstOccurActions takes nothing returns nothing
    call DzUnlockOpCodeLimit(true)
endfunction
//===========================================================================
function InitTrig_firstOccur takes nothing returns nothing
    set gg_trg_firstOccur=CreateTrigger()
    call TriggerAddAction(gg_trg_firstOccur, function Trig_firstOccurActions)
endfunction
//===========================================================================
// Trigger: 简介
//===========================================================================
function Trig_______uActions takes nothing returns nothing
    // 欢迎使用世界编辑器，开始你的地图创造之旅。
    // 你可以从https://reckfeng.com/获取最新编辑器咨询。
    // 当你的地图意外损坏时，你可以在backups目录找到你最近26次保存的地图。
    // 任何疑问请加官方作者群：QQ433807374。
endfunction
//===========================================================================
function InitTrig_______u takes nothing returns nothing
    set gg_trg_______u=CreateTrigger()
    call TriggerAddAction(gg_trg_______u, function Trig_______uActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_firstOccur()
    call InitTrig_______u()
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_002
    call SetPlayerTeam(Player(0), 0)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 11520.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 11776.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 11520.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 11264.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 11520.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 11264.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 11520.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 11776.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call InitBlizzard()

call ExecuteFunc("OnInit")
call ExecuteFunc("LBKKAPI___Init")

    call InitGlobals()
    call InitCustomTriggers()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("武侠脚手架")
    call SetMapDescription("没有说明")
    call SetPlayers(1)
    call SetTeams(1)
    call SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    call DefineStartLocation(0, - 6016.0, - 7552.0)
    // Player setup
    call InitCustomPlayerSlots()
    call SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    call InitGenericPlayerSlots()
endfunction
// [DzSetUnitMoveType]  
// title = "设置单位移动类型[NEW]"  
// description = "设置 ${单位} 的移动类型：${movetype} "  
// comment = ""  
// category = TC_KKPRE  
// [[.args]]  
// type = unit  
// [[.args]]  
// type = MoveTypeName  
// default = MoveTypeName01  




//Struct method generated initializers/callers:

