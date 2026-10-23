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
import type { DiagnosticsInput, WorkspaceDiagnosticsInput } from '../schemas/tool-schemas.js';
import type { DiagnosticsResponse, WorkspaceDiagnosticsResponse } from '../types.js';
/**
 * Handle lsp_diagnostics tool call.
 */
export declare function handleDiagnostics(input: DiagnosticsInput): Promise<DiagnosticsResponse>;
/**
 * Handle lsp_workspace_diagnostics tool call.
 * Returns all diagnostics across the workspace from cache.
 */
export declare function handleWorkspaceDiagnostics(input: WorkspaceDiagnosticsInput): Promise<WorkspaceDiagnosticsResponse>;
//# sourceMappingURL=diagnostics.d.ts.map