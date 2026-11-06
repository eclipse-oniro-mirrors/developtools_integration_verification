"""采集与查询共用的表结构定义。

**为什么单独一个顶层包**：`agentic/`（查询层 + skill）要能独立发布，
但 arkts 的表结构是采集侧与查询侧共用的。三种放法实测过（见
`agentic/docs/standalone-packaging.md` §5）：

- 软链 —— 不行。`tables.py` 用的是相对 import，软链到别的深度直接断；
  改绝对 import 又把 `oskm` 依赖焊死。更要命的是同一文件经两个模块名加载
  会产生**两份 Table 实例**，而代码里有 `if table is KITS` 这类身份比较，
  跨模块恒为 False —— 不报错，分支静默失效。
- 依赖倒置（collector 反过来 import agentic）—— 可行但方向别扭。
- **中立第三包** —— 一个模块名、一份实例、不倒置。就是这里。

`base.py` 是纯叶子（只 import re 与 dataclasses），所以这个包不依赖
`oskm` 也不依赖 `agentic`，两边都能单独带走。
"""
from .base import (SCAN_COLUMN, SCANS, COLLECTOR_RUNS, COLLECTOR_TABLES, ISSUES,
                   FRAMEWORK_TABLES, Column, Index, SchemaError, Table)

__all__ = ['SCAN_COLUMN', 'SCANS', 'COLLECTOR_RUNS', 'COLLECTOR_TABLES', 'ISSUES',
           'FRAMEWORK_TABLES', 'Column', 'Index', 'SchemaError', 'Table']
