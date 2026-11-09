# 0803（约 305 条）实现情况详细报告

> 更新日期：2026-08-05（**去假 marker 后**）；对照：`需求/0803-UI对比自动化用例实现.xlsx` + `docs/0803_*.md` + `uiCompareTest_13` / `uiAssertTest_01`。

## 1. 策略结论（先看这个）

| 原则 | 做法 |
|------|------|
| **禁止假通过** | 不再保留「按钮 → 写 `*_pending` → expect」占位用例 |
| **写不了就删** | 美团 / 华为账号 / 运动健康 UEC、`OVERFLOW_HAD`、手表 `GRIDROW` 断点、三方 App 图、小语种、PC 窗管、元服务胶囊等 **整套删除** |
| **能写就真写** | `UIExtensionComponent` / `XComponent` / `PluginComponent` 用真组件 + 可观测回调（无效 Want/source → `onError`；SURFACE → `onLoad`） |
| **弱增强可接受** | 批量 Shape/布局深度/Split/本地 Video 等，不强行伪装成原需求全链路 |

当前工程规模：Snap **~89** Suite（含 12 条 TextPicker 手势 uuid 用例）；Assert **~111** Suite（删除约 **93** 条假/不可写后）。Assert 内 **0** 处 `assert_ready_pending` / `manual_case_pending`。

xlsx G/H 列已全量标注（2026-08-06）：**已实现 ~197** + **无法实现 108** = **305**。  
「非 SUB_*」**不再**作为不实现理由；Picker 手势 uuid 已进 `uiCompareTest_13`。

## 2. 总数口径

| 口径 | 数量 | 说明 |
|------|------|------|
| xlsx 数据行 | **305** | Sheet1 除表头 |
| 已实现（xlsx） | **~197** | Snap `_13` + Assert `_01`（含双轨 1） |
| 无法实现（xlsx） | **108** | 删除 93 + 手表/表冠 11 + hidumper/多UEA/NATIVE 提供方 4 |
| Assert 现网 Suite | **~111** | 真组件或弱增强 |
| Snap 现网 Suite | **~89** | 组件视觉截图 + TextPicker 手势 |

## 3. 删除类（明确写不了）

| 类别 | 代表 | 原因 |
|------|------|------|
| 三方 / 系统 App UEC | 美团 `0114`、华为账号 `0102`、运动健康 `0105` | 需已装对应 Ability + 账号环境 |
| HAD / 手表断点 | `OVERFLOW_HAD_0100`、`GRIDROW_*BREAKPOINT_0100` | 需手表形态 / 系统 HAD |
| 三方 App 图 / 图库云图 | `IMAGE_APP_*`、图库相关 | 需抖音/微信等安装与素材 |
| 系统小语种 | `MINOR_LANGUAGE_*` | 改系统语言，破坏性大 |
| PC 窗管 / 触控板 | `WINDOW_*`、titlebar、gestures | 需 PC 自由窗设备 |
| 元服务 / MenuBar | AtomicService 等 | 需 ASCF/元服务拉起 |
| Native/YUV/Inspector 等重依赖 | 多条 IMAGE / SR / TRACE | 需专用 Native/系统调试环境 |

## 4. 保留并实现类

| 类别 | 实现方式 | 说明 |
|------|----------|------|
| UIExtension | 真 `UIExtensionComponent` + 无效 Want → `onError` | 无真 UEA 时断言错误路径，非「假 pending」 |
| XComponent | 真 SURFACE + controller → `onLoad` | 弱于 Native/CAPI 全链路，但是真组件 |
| PluginComponent | 真组件 + 无效 source → `onError` | 同上 |
| Shape / Split / 深度布局 / Video 等 | 弱增强节点数或本地源 | 可断言，不等同原需求极端负载 |

设备抽样（去假后，`192.168.12.136:8710`）：UEC / Plugin / XComponent / TextClock / Shape 等 **5/5 Pass**；Assert 全量 List 未宣称全绿。

## 5. 仍无法实现（xlsx 已写清原因，禁止用「非 SUB」搪塞）

| 类 | 条数 | 真实原因 |
|----|------|----------|
| 手表/表冠 | 11 | 无手表形态与 digitalCrown |
| hidumper A11y dump | 1 | `AccessibilityTestLevel023` 依赖 WMS `-element -c` 沙箱 dump |
| 多 UEA 提供方 | 1 | `UIExtensionTestLevel09` 需 provider3/4/5 套件 |
| Embedded NATIVE | 2 | 需 Embedded 专用提供方 HAP（terminate/生命周期超时注入）；Assert 里旧假 pending **不算覆盖** |

Picker 手势 `TestCase_<uuid>`（12）已补入 `uiCompareTest_13`。

## 6. 文档与脚本

- 进度：`docs/0803_impl_progress.md`
- 分流表：`docs/0803_{snap,assert,manual}_cases.md`
- 工具：`tools/purge_fake_markers_and_realize.py`

## 7. 与「305 全覆盖」的关系

本仓目标是 **可维护、可编签、可设备验证的真实用例**，不是用假 expect 把 305 行全部刷绿。  
xlsx **G/H 必须可视**：已实现写工程；其余写**环境/依赖**原因。
