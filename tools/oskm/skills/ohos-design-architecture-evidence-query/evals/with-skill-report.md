# With Skill 评估报告

- 评估对象：`ohos-design-architecture-evidence-query` 3.0.0
- 评估日期：2026-11-12
- 基线提交：`d867cf7c`
- 评估方式：加载 `SKILL.md` 与 `references/usage.md`，执行 `evals/evals.json` 中 8 个场景，并用对应确定性测试复核。
- 结论：**8/8 通过**

## 场景结果

| ID | 场景 | 结果 | 证据 |
|---:|---|---|---|
| 1 | 首次安装完整归档 | Pass | `test_install_extracts_complete_runtime_bundle`、`test_downloaded_runtime_extracts_database_and_both_sdk_trees` |
| 2 | OPENHARMONY_CI 精确日期 | Pass | `test_openharmony_posts_fixed_component_and_exact_date_range` |
| 3 | HARMONYOS_CI 精确日期 | Pass | `test_harmonyos_gets_exact_date` |
| 4 | 损坏归档保留旧运行时 | Pass | `test_invalid_sqlite_preserves_existing_output`、`test_runtime_bundle_failure_preserves_existing_output` |
| 5 | 源码根本地运行时优先 | Pass | `test_install_prefers_one_level_source_runtime_without_download` |
| 6 | CLI 解析链与失败提示 | Pass | `test_env_override_beats_everything`、`test_installed_artifact_beats_the_source_tree`、`test_without_a_cli_the_failure_is_actionable` |
| 7 | 刷新必须显式触发 | Pass | `test_current_date_and_present_files_do_not_refresh`、`test_previous_date_refreshes_both_artifacts`、`test_unmanaged_runtime_is_never_refreshed` |
| 8 | 合成库组合烟测 | Pass | `test_the_two_artifacts_compose` |

## 验证命令

```bash
cd packages/oskm
env -u OSKM_TEST_DB python3.12 -m unittest discover \\
  -s skills/ohos-design-architecture-evidence-query/tests -p "test_*.py"
python3.12 -m json.tool \\
  skills/ohos-design-architecture-evidence-query/evals/evals.json
```

## 自动化验证

- Skill 全量测试：201 passed
- `evals.json` JSON 解析：通过
- `skill-creator/quick_validate.py`：`Skill is valid!`

## 结论

Skill 明确区分安装入口与查询入口；归档四件套、CLI 三级解析、显式刷新和失败回滚均符合预期。评估未依赖真实数据库业务统计。
