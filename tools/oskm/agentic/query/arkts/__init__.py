"""ArkTS 的查询侧。

原先住在 `oskm/collectors/arkts/`——那是采集器包，而这三个文件
（query / records / export）只在**查询**时用：`from ...arkts import ArktsQuery`
加载它们时，collector / projection / backend / napi 一个都不碰（实测）。
分界本来就存在，只是没搬家。

搬过来之后 `agentic/` 对 `oskm.collectors` 的 import 归零。
共用的表结构在中立包 `oskm_schema.arkts`，两边都从那里取，
**一个模块名、一份 Table 实例**——这正是不用软链的原因，见
`agentic/docs/standalone-packaging.md` §5。
"""
from .query import ArktsQuery
from .export import export_document

__all__ = ['ArktsQuery', 'export_document']
