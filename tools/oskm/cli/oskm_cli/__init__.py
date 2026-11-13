"""oskm 只读查询 CLI —— 独立产物。

给它一个 `knowledge.db`，它给答案。**不联网、不写盘、不认识 `~/.oskm`**：
下载 DB / SDK / CLI 本身都是 skill（`ohos-design-architecture-evidence-query`）
的职责，见 `docs/architecture/cli-skill-split.md`。

`__version__` **只由 `--version` 报告**，不进文件名也不参与任何校验：
CLI 与 `knowledge.db` 同类，固定名 `oskm-cli.pyz`、不记版本、不锁摘要。
skill 的 `cli_install.py` 靠结构校验（`verify_pyz`）判断产物能不能用。
"""

__version__ = '1.0.0'

__all__ = ['__version__']
