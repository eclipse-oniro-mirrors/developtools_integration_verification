# 上库清单

- Skill：`ohos-design-architecture-evidence-query`
- 版本：3.0.0
- 检查日期：2026-11-12

| # | 检查项 | 结果 | 证据 |
|---:|---|---|---|
| 1 | Skill name 全局唯一 | Pass | 本仓仅一个 `SKILL.md`；公开网络精确检索未发现同名 skill |
| 2 | 符合 `ohos-<stage>-<domain>-<capability>` | Pass | `ohos` / `design` / `architecture` / `evidence-query` |
| 3 | capability 使用名词短语 | Pass | `evidence-query` 表示证据查询能力 |
| 4 | 目录名与 `SKILL.md` name 一致 | Pass | 两者为 `ohos-design-architecture-evidence-query` |
| 5 | 有效 YAML Front Matter | Pass | `skill-creator quick_validate.py` 返回 `Skill is valid!` |
| 6 | description 说明触发场景 | Pass | 覆盖安装/更新运行时、CLI、架构证据查询与只读边界 |
| 7 | 包含 eval 用例 | Pass | `evals/evals.json`，8 个场景、29 条断言 |
| 8 | with skill 评估全部通过 | Pass | `with-skill-report.md`，8/8 通过 |
| 9 | 上传 with/without 最终评估报告 | Pass | `with-skill-report.md`、`without-skill-report.md` |
| 10 | skill-judge 达到 B 级或以上 | Pass | `skill-judge-report.md`，109/120（90.8%），A 级 |
