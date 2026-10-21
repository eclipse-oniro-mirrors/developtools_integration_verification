#!/usr/bin/env python3
"""Single CLI entry point; subcommands come from the collector registry."""
from oskm.cli import main

if __name__ == '__main__':
    raise SystemExit(main())
