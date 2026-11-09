"""Source-only module/Kit collection; querying never loads Node.

查询侧（ArktsQuery / export_document）已移到 `agentic/query/arkts/`——
它们只在查询时用，留在采集器包里会让查询层被迫依赖整个 collectors 树。
共用的表结构与行投射在中立包 `oskm_schema`。
见 `agentic/docs/standalone-packaging.md` §5。
"""
