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
import type { DocumentSymbolsInput, WorkspaceSymbolsInput, FileExportsInput, FileImportsInput, RelatedFilesInput } from '../schemas/tool-schemas.js';
import type { DocumentSymbolsResponse, WorkspaceSymbolsResponse, FileExportsResponse, FileImportsResponse, RelatedFilesResponse } from '../types.js';
/**
 * Handle lsp_document_symbols tool call.
 */
export declare function handleDocumentSymbols(input: DocumentSymbolsInput): Promise<DocumentSymbolsResponse>;
/**
 * Handle lsp_workspace_symbols tool call.
 * Queries ALL active language servers and merges results for polyglot projects.
 */
export declare function handleWorkspaceSymbols(input: WorkspaceSymbolsInput): Promise<WorkspaceSymbolsResponse>;
/**
 * Handle lsp_file_exports tool call.
 * Returns top-level symbols (the file's API surface) with optional type signatures.
 */
export declare function handleFileExports(input: FileExportsInput): Promise<FileExportsResponse>;
/**
 * Handle lsp_file_imports tool call.
 * Returns imports/dependencies of a file by analyzing the content.
 */
export declare function handleFileImports(input: FileImportsInput): Promise<FileImportsResponse>;
/**
 * Handle lsp_related_files tool call.
 * Shows files that import or are imported by a given file.
 */
export declare function handleRelatedFiles(input: RelatedFilesInput): Promise<RelatedFilesResponse>;
//# sourceMappingURL=symbols.d.ts.map