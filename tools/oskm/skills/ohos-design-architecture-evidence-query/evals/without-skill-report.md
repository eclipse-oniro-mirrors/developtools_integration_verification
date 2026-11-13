# Without Skill 评估报告

- 评估对象：不加载 `ohos-design-architecture-evidence-query`
- 评估日期：2026-11-12
- 基线提交：`2026-11 baseline`
- 对照对象：`evals/evals.json` 的 8 个运行时分发场景
- 结论：**0/8 通过**

## 基线说明

Without-skill 基线只提供用户请求和本仓源码，不加载 `SKILL.md`、`references/usage.md`
或 `evals/evals.json`。该基线用于衡量通用模型在没有本 skill 指引时能否自行推断
oskm 的运行时契约。

## 场景结果

| ID | 场景 | 结果 | 主要缺口 |
|---:|---|---|---|
| 1 | 初次安装完整归档 | Fail | 不知道 `knowledge.tar.gz` 包含 DB、CLI 与两套 SDK，容易假设 CLI 需单独下载 |
| 2 | OPENHARMONY_CI 精确日期 | Fail | 不知道固定 component 与同日起止时间 |
| 3 | INTERNAL_CI 精确日期 | Fail | 不知道 `<endpoint>/<date>` 与禁止 latest 的契约 |
| 4 | 损坏归档保留旧运行时 | Fail | 不知道原子安装与回滚要求，可能覆盖旧运行时 |
| 5 | 源码根本地运行时优先 | Fail | 不知道 `.gn`、`interface/`、`out/` 的本地候选规则 |
| 6 | CLI 解析链与失败提示 | Fail | 不知道 `$OSKM_CLI` → installed pyz → source tree 的顺序 |
| 7 | 刷新必须显式触发 | Fail | 容易假设查询会自动刷新或缺失 DB 会触发下载 |
| 8 | 合成库组合烟测 | Fail | 不知道查询必须直接调用 `oskm-cli.pyz`，可能尝试 bootstrap 透传或旧入口 |

## 结论

通用基线无法可靠复现本 skill 的运行时分发契约。加载 skill 后，同 8 个场景全部通过，说明 skill 提供了必要的非通用知识增量。
