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
import type { TextEdit, WorkspaceEdit } from 'vscode-languageserver-protocol';
export interface CollectedTextEdits {
    /** Text edits per document URI, from both `changes` and `documentChanges` */
    editsByUri: Record<string, TextEdit[]>;
    /** Number of file create/rename/delete operations in `documentChanges` */
    fileOperations: number;
}
/**
 * Collect the text edits of a WorkspaceEdit, whether the server sent them in
 * `changes` or in `documentChanges` (e.g. pylsp). File create, rename, and
 * delete operations are counted but not collected, because they cannot be
 * applied as text edits.
 */
export declare function collectTextEdits(edit: WorkspaceEdit | null | undefined): CollectedTextEdits;
//# sourceMappingURL=workspace-edit.d.ts.map