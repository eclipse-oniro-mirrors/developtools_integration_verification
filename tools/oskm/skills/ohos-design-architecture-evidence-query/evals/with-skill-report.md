# With Skill 评估报告

- 评估对象：`ohos-design-architecture-evidence-query` 3.0.0
- 评估日期：2026-11-16
- 基线提交：`2026-11 baseline`
- 评估方式：加载 `SKILL.md` 与 `references/usage.md`，执行 `evals/evals.json` 中 8 个场景，并用对应确定性测试复核。
- 结论：**8/8 通过**

## 场景结果

| ID | 场景 | 结果 | 证据 |
|---:|---|---|---|
| 1 | 初次安装完整归档 | Pass | `test_install_extracts_complete_runtime_bundle`、`test_install_keeps_the_agent_start_directory` |
| 2 | OPENHARMONY_CI 精确日期 | Pass | `test_openharmony_posts_fixed_component_and_exact_date_range` |
| 3 | INTERNAL_CI 精确日期 | Pass | `test_internal_gets_exact_date` |
| 4 | 损坏归档保留旧运行时 | Pass | `test_invalid_sqlite_preserves_existing_output`、`test_runtime_bundle_failure_preserves_existing_output` |
| 5 | 源码根本地运行时优先 | Pass | `test_install_uses_the_source_tree_cli_with_a_local_runtime`、`test_install_prefers_artifacts_database_without_download` |
| 6 | CLI 解析链与失败提示 | Pass | `test_env_override_beats_everything`、`test_source_tree_beats_the_installed_artifact`、`test_without_a_cli_the_failure_is_actionable` |
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

- Skill 全量测试：205 passed
- `evals.json` JSON 解析：通过
- `skill-creator/quick_validate.py`：`Skill is valid!`

## 结论

Skill 明确区分安装入口与查询入口；安装后保持 Agent 启动目录，源码树优先使用本地 DB、CLI 与两套 SDK，回退到归档时保持原子安装和回滚。评估未依赖真实数据库业务统计。
