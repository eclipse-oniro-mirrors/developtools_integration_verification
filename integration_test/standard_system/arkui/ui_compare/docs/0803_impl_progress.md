# 0803 实现进度

| 清单 | 已实现 | 清单总数 | 说明 |
|------|--------|----------|------|
| Snap（进 `_13` HAP） | 77 | ~121 | 组件视觉截图 |
| Snap/Assert/Manual 分流表 backtick 编号 | **267 / 267** | | 全量落盘 |
| Assert/Manual 重依赖 | marker | | `assert_ready_pending` / `manual_case_pending` |

## 设备验证（2026-08-05，`192.168.12.136:8710`）

| 工程 | 编签 | 抽样跑测 |
|------|------|----------|
| `uiCompareTest_13` | Pass（修 Badge `count`） | **8/8 Pass**（Progress/Badge/ImageAPI/QRCode/DC/Interaction/Crossplatform） |
| `uiAssertTest_01` | Pass | **8/8 Pass**（Native/UEC/Plugin/XComponent/Window/IMAGE_APP/小语种 marker） |

安装需在签名 profile 写入 `restricted-permissions`（`CAPTURE_SCREEN` / `SYSTEM_FLOAT_WINDOW` 等）；本地编签临时 numeric `compileSdkVersion: 26`，提交仍用 `"26.0.0"`。

## 脚本

`tools/gen_0803_batch{2,3,4}.py`、`tools/gen_0803_fill_remaining.py`、`tools/unify_tc_comments.py`。
