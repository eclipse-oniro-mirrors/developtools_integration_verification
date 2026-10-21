#!/usr/bin/env python3
"""oskm MCP server — JSON-RPC 2.0 over stdio.

Usage:
    python3 -m agentic.mcp.server --db /path/to/knowledge.db
    python3 -m agentic.mcp.server --db /path/to/knowledge.db --scan-id 2

The server speaks MCP protocol (newline-delimited JSON-RPC 2.0) on stdio.
All tools are read-only against the database — no scanning, no writes.
"""
from __future__ import annotations

import sys
import json
import argparse
import importlib

# Initialize the collector registry before any tool is registered.
from oskm.core import framework
framework.discover()

# Import tool modules to trigger @register decorators.
for _mod in ('session', 'repos', 'component', 'service', 'install',
             'gn_args', 'elf', 'sa', 'hdi', 'query', 'issues', 'schema'):
    importlib.import_module(f'.tools.{_mod}', package='agentic.mcp')

from .session import SessionManager
from .tools import export as export_tools, dispatch


def handle_request(request: dict, manager: SessionManager) -> dict | None:
    """Process one JSON-RPC request, return response or None (for notifications)."""
    method = request.get('method', '')
    req_id = request.get('id')

    if method == 'initialize':
        return {
            'jsonrpc': '2.0', 'id': req_id,
            'result': {
                'protocolVersion': '2024-11-05',
                'capabilities': {'tools': {}, 'resources': {}},
                'serverInfo': {'name': 'oskm', 'version': '0.1.0'},
            }
        }

    if method == 'notifications/initialized':
        return None  # notification, no response

    if method == 'tools/list':
        return {'jsonrpc': '2.0', 'id': req_id, 'result': {'tools': export_tools()}}

    if method == 'tools/call':
        params = request.get('params', {})
        name = params.get('name', '')
        args = params.get('arguments', {})
        result = dispatch(name, args, manager)
        return {'jsonrpc': '2.0', 'id': req_id, 'result': result}

    if method == 'resources/list':
        return {'jsonrpc': '2.0', 'id': req_id, 'result': {'resources': []}}

    if method == 'resources/read':
        return {'jsonrpc': '2.0', 'id': req_id, 'result': {'contents': []}}

    if req_id is not None:
        return {
            'jsonrpc': '2.0', 'id': req_id,
            'error': {'code': -32601, 'message': f'method not found: {method}'}
        }
    return None


def main():
    parser = argparse.ArgumentParser(description='oskm MCP server')
    parser.add_argument('--db', help='Initial database path')
    parser.add_argument('--scan-id', type=int, help='Initial scan id')
    args = parser.parse_args()

    manager = SessionManager()
    if args.db:
        try:
            info = manager.open(args.db, scan_id=args.scan_id)
            sys.stderr.write(f'oskm MCP: connected to scan {info["scan_id"]} '
                             f'(product={info["product"]})\n')
        except Exception as e:
            sys.stderr.write(f'oskm MCP: failed to open {args.db}: {e}\n')

    sys.stderr.write('oskm MCP: listening on stdio\n')
    for line in sys.stdin:
        line = line.strip()
        if not line:
            continue
        try:
            request = json.loads(line)
        except json.JSONDecodeError:
            continue
        response = handle_request(request, manager)
        if response is not None:
            sys.stdout.write(json.dumps(response) + '\n')
            sys.stdout.flush()


if __name__ == '__main__':
    main()
