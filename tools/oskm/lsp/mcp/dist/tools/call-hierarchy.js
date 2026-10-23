/**
 * Copyright (c) 2026 Ivan Iraci <ivan.iraci@professioneit.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import { prepareFile, toPosition, getSymbolKindName } from './utils.js';
import { uriToPath } from '../utils/uri.js';
import { LSPError, LSPErrorCode } from '../types.js';
/** JSON-RPC error code for a method the server does not implement. */
const METHOD_NOT_FOUND = -32601;
function isMethodNotFound(error) {
    return typeof error === 'object' && error !== null && error.code === METHOD_NOT_FOUND;
}
/**
 * Convert CallHierarchyItem to our result format.
 */
function convertItem(item) {
    const result = {
        name: item.name,
        kind: getSymbolKindName(item.kind),
        path: uriToPath(item.uri),
        line: item.range.start.line + 1,
        column: item.range.start.character + 1,
        range: {
            start: { line: item.range.start.line + 1, column: item.range.start.character + 1 },
            end: { line: item.range.end.line + 1, column: item.range.end.character + 1 },
        },
        selection_range: {
            start: { line: item.selectionRange.start.line + 1, column: item.selectionRange.start.character + 1 },
            end: { line: item.selectionRange.end.line + 1, column: item.selectionRange.end.character + 1 },
        },
    };
    if (item.detail) {
        result.detail = item.detail;
    }
    if (item.tags && item.tags.length > 0) {
        result.tags = item.tags.map(t => t === 1 ? 'deprecated' : `tag_${t}`);
    }
    return result;
}
/**
 * Convert CallHierarchyIncomingCall to our result format.
 */
function convertIncomingCall(call) {
    return {
        from: convertItem(call.from),
        from_ranges: call.fromRanges.map(r => ({
            start: { line: r.start.line + 1, column: r.start.character + 1 },
            end: { line: r.end.line + 1, column: r.end.character + 1 },
        })),
    };
}
/**
 * Convert CallHierarchyOutgoingCall to our result format.
 */
function convertOutgoingCall(call) {
    return {
        to: convertItem(call.to),
        from_ranges: call.fromRanges.map(r => ({
            start: { line: r.start.line + 1, column: r.start.character + 1 },
            end: { line: r.end.line + 1, column: r.end.character + 1 },
        })),
    };
}
/**
 * Handle lsp_call_hierarchy tool call.
 */
export async function handleCallHierarchy(input) {
    const { file_path, line, column, direction } = input;
    const { client, uri, content } = await prepareFile(file_path);
    // Try the exact position first; if it misses (the caller may have passed a
    // blank line, an off-by-one line number, or a column outside the
    // identifier), retry adjacent lines at the same column before giving up.
    const candidates = [line, line + 1, line - 1, line + 2, line - 2];
    let items = undefined;
    let usedLine = line;
    for (const candidateLine of candidates) {
        if (candidateLine < 1)
            continue;
        const position = toPosition(candidateLine, column, content);
        // eslint-disable-next-line no-await-in-loop
        items = await client.prepareCallHierarchy(uri, position);
        if (items && items.length > 0) {
            usedLine = candidateLine;
            break;
        }
    }
    if (!items || items.length === 0) {
        throw new LSPError(LSPErrorCode.CAPABILITY_NOT_SUPPORTED, 'No call hierarchy item found at this position', 'Move cursor onto a function or method identifier (not whitespace or a keyword). If you do not know the exact position, try lsp_smart_search with include=["incoming_calls","outgoing_calls"] — it locates the symbol from a hover-based position and tolerates missing capabilities.', { file_path, position: { line, column } });
    }
    // Use the first item (usually there's only one)
    const item = items[0];
    const result = {
        item: convertItem(item),
    };
    if (usedLine !== line) {
        result.notes = [
            `Requested position (line ${line}, column ${column}) had no call hierarchy item; ` +
                `resolved on line ${usedLine}. Line numbers are 1-indexed; pass the line where ` +
                'the function identifier actually appears.',
        ];
    }
    const notes = result.notes ?? [];
    // Get incoming calls if requested
    if (direction === 'incoming' || direction === 'both') {
        try {
            const incomingCalls = await client.callHierarchyIncomingCalls(item);
            if (incomingCalls && incomingCalls.length > 0) {
                result.incoming_calls = incomingCalls.map(convertIncomingCall);
            }
        }
        catch (error) {
            // Some servers declare callHierarchyProvider but only implement part of
            // the protocol. Degrade gracefully instead of failing the whole tool.
            if (isMethodNotFound(error)) {
                notes.push('Language server does not implement callHierarchy/incomingCalls.');
            }
            else {
                throw error;
            }
        }
    }
    // Get outgoing calls if requested
    if (direction === 'outgoing' || direction === 'both') {
        try {
            const outgoingCalls = await client.callHierarchyOutgoingCalls(item);
            if (outgoingCalls && outgoingCalls.length > 0) {
                result.outgoing_calls = outgoingCalls.map(convertOutgoingCall);
            }
        }
        catch (error) {
            // clangd, for example, declares callHierarchyProvider but has never
            // implemented callHierarchy/outgoingCalls upstream. Degrade gracefully.
            if (isMethodNotFound(error)) {
                notes.push('Language server does not implement callHierarchy/outgoingCalls (known clangd limitation: only incoming calls are supported).');
            }
            else {
                throw error;
            }
        }
    }
    if (notes.length > 0) {
        result.notes = notes;
    }
    return result;
}
//# sourceMappingURL=call-hierarchy.js.map