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
import type { Diagnostic, Location, LocationLink, MarkupContent } from 'vscode-languageserver-protocol';
import type { LocationResult, LSPClient } from '../types.js';
/**
 * Prepare a file for LSP operations by ensuring it's open with the appropriate server.
 */
export declare function prepareFile(filePath: string): Promise<{
    client: LSPClient;
    uri: string;
    content: string;
    /** When this call opened the document or sent it changed content, else null */
    touchedAt: number | null;
}>;
/**
 * Get the current diagnostics for an open document.
 *
 * Servers that provide diagnostics on request (e.g. the TypeScript 7 native
 * server, which only publishes empty lists, or rust-analyzer) are asked
 * directly; the result also includes what they published, after waiting for
 * a fresh publish if earlier published diagnostics may be stale. For push-model
 * servers the cached diagnostics are used; when `waitSince` is set (the
 * document was just opened or changed), first wait briefly for a fresh publish.
 */
export declare function getCurrentDiagnostics(client: LSPClient, uri: string, waitSince: number | null): Promise<Diagnostic[]>;
/**
 * Pull fresh diagnostics for every document open in a running server instance
 * that provides diagnostics on request, so workspace-wide views are current.
 */
export declare function pullOpenDocumentDiagnostics(): Promise<void>;
/**
 * Forget files that no longer exist on disk.
 *
 * For each deleted file: close it in every running server instance that has it
 * open, notify servers that registered for workspace/didDeleteFiles, and drop
 * its cached diagnostics. Without this, diagnostics for deleted or renamed
 * files are reported forever.
 *
 * @param candidateUris - URIs to check; defaults to every URI with cached
 *   diagnostics or open in a running server instance
 * @returns The URIs that were forgotten
 */
export declare function forgetDeletedFiles(candidateUris?: Iterable<string>): Promise<string[]>;
/**
 * Convert an LSP Location to our LocationResult format.
 */
export declare function locationToResult(location: Location, content?: string): Promise<LocationResult>;
/**
 * Convert an LSP LocationLink to our LocationResult format.
 */
export declare function locationLinkToResult(link: LocationLink): Promise<LocationResult>;
/**
 * Convert LSP locations (which can be Location, Location[], or LocationLink[]) to LocationResult[].
 */
export declare function convertLocations(result: Location | Location[] | LocationLink[] | null): Promise<LocationResult[]>;
/**
 * Get human-readable symbol kind name.
 */
export declare function getSymbolKindName(kind: number): string;
/**
 * Get human-readable completion kind name.
 */
export declare function getCompletionKindName(kind: number | undefined): string;
/**
 * Get human-readable diagnostic severity name.
 */
export declare function getDiagnosticSeverityName(severity: number | undefined): 'error' | 'warning' | 'info' | 'hint';
/**
 * Normalize a diagnostic message to a plain string.
 * As of LSP types 3.18, `Diagnostic.message` may be a `MarkupContent` object
 * rather than a plain string; in that case we use its `value`.
 */
export declare function getDiagnosticMessageText(message: string | MarkupContent): string;
/**
 * Convert 1-indexed position to LSP position for a file.
 */
export declare function toPosition(line: number, column: number, content: string): import("vscode-languageserver-types").Position;
/**
 * Filter symbol kinds based on requested kinds.
 */
export declare function matchesSymbolKind(symbolKind: number, requestedKinds?: string[]): boolean;
//# sourceMappingURL=utils.d.ts.map