"""Tool registry, error types, and JSON Schema helpers."""
import json
from dataclasses import dataclass, field
from typing import Any, Callable

REGISTRY: list['Tool'] = []


class ToolError(Exception):
    def __init__(self, code: str, message: str = '', details: dict | None = None):
        self.code = code
        self.message = message or code
        self.details = details


@dataclass
class Tool:
    name: str
    description: str
    input_schema: dict
    handler: Callable[[dict, 'SessionManager'], dict]

    def call(self, params: dict, manager) -> dict:
        try:
            result = self.handler(params, manager)
            return result
        except ToolError as e:
            err = {'code': e.code, 'message': e.message}
            if e.details:
                err['details'] = e.details
            return {'error': err}
        except KeyError as e:
            return {'error': {'code': 'MISSING_PARAM', 'message': f'parameter {e} required'}}
        except (ValueError, TypeError) as e:
            return {'error': {'code': 'INVALID_PARAM', 'message': str(e)}}
        except Exception as e:
            return {'error': {'code': 'INTERNAL', 'message': str(e)}}


def register(name: str, description: str, schema: dict | None = None):
    """Register a tool. Usage:

    @register('get_tables', 'List all registered table names')
    def get_tables(params, manager):
        ...
    """
    def decorator(fn):
        REGISTRY.append(Tool(
            name=name,
            description=description,
            input_schema=schema or {'type': 'object', 'properties': {}},
            handler=fn,
        ))
        return fn
    return decorator


def export():
    """Return tool definitions for tools/list response."""
    return [
        {'name': t.name, 'description': t.description, 'inputSchema': t.input_schema}
        for t in REGISTRY
    ]


def dispatch(name: str, params: dict, manager) -> dict:
    """Dispatch a tool call by name."""
    for t in REGISTRY:
        if t.name == name:
            return t.call(params, manager)
    return {'error': {'code': 'TOOL_NOT_FOUND', 'message': f'unknown tool: {name}'}}


# Auto-import all tool modules to trigger @register decorators.
# Placed at the end to avoid circular imports: REGISTRY and register are
# already defined above when these modules import from .. (this package).
import importlib as _il
for _mod in ('session', 'repos', 'component', 'service', 'install',
             'gn_args', 'elf', 'sa', 'hdi', 'query', 'issues', 'schema'):
    _il.import_module(f'.{_mod}', package=__name__)
