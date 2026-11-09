"""`python3 -m agentic` 的入口。

发布后 `oskm.py`（在上一级）不随包走，所以 skill 里只写这一个入口：
它在仓内与发布后都成立。
"""
from .cli import main

if __name__ == '__main__':
    raise SystemExit(main())
