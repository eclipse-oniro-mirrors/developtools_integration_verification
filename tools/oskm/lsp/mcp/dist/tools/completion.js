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
import { prepareFile, toPosition, getCompletionKindName } from './utils.js';
/**
 * Convert completion item documentation to string.
 */
function documentationToString(doc) {
    if (!doc) {
        return undefined;
    }
    if (typeof doc === 'string') {
        return doc;
    }
    if ('value' in doc) {
        return doc.value;
    }
    return undefined;
}
/**
 * Convert CompletionItem to our format.
 */
function completionItemToResultlt(item) {
    const result = {
        label: item.label,
        kind: getCompletionKindName(item.kind),
    };
    if (item.detail) {
        result.detail = item.detail;
    }
    const doc = documentationToString(item.documentation);
    if (doc) {
        result.documentation = doc;
    }
    if (item.insertText) {
        result.insert_text = item.insertText;
    }
    if (item.sortText) {
        result.sort_text = item.sortText;
    }
    return result;
}
/**
 * Handle lsp_completions tool call.
 */
export async function handleCompletions(input) {
    const { file_path, line, column, limit } = input;
    const { client, uri, content } = await prepareFile(file_path);
    // Convert position
    const position = toPosition(line, column, content);
    // Call LSP
    const result = await client.completion(uri, position);
    if (!result) {
        return {
            completions: [],
            is_incomplete: false,
        };
    }
    // Normalize to array and check if incomplete
    let items;
    let isIncomplete = false;
    if (Array.isArray(result)) {
        items = result;
    }
    else {
        // CompletionList
        const list = result;
        items = list.items;
        isIncomplete = list.isIncomplete;
    }
    // Convert and limit
    const completions = items
        .slice(0, limit)
        .map(item => completionItemToResultlt(item));
    return {
        completions,
        is_incomplete: isIncomplete || items.length > limit,
    };
}
//# sourceMappingURL=completion.js.map