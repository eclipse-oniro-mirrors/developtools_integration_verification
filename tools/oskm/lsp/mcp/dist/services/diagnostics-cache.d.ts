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
import type { Diagnostic } from 'vscode-languageserver-protocol';
import type { DiagnosticsCache as IDiagnosticsCache } from '../types.js';
/**
 * Caches diagnostics received from language servers via publishDiagnostics notifications.
 *
 * Diagnostics in LSP are push-based - servers send them proactively when files change.
 * This cache stores them so tools can retrieve them on demand.
 */
export declare class DiagnosticsCacheImpl implements IDiagnosticsCache {
    private cache;
    /**
     * Update cached diagnostics for a URI.
     * Called when publishDiagnostics notification is received.
     */
    update(uri: string, diagnostics: Diagnostic[]): void;
    /**
     * Get cached diagnostics for a URI.
     */
    get(uri: string): Diagnostic[];
    /**
     * Clear diagnostics for a URI.
     * Called when document is closed.
     */
    clear(uri: string): void;
    /**
     * Clear all cached diagnostics.
     * Called when server restarts.
     */
    clearAll(): void;
    /**
     * Get all URIs with cached diagnostics.
     */
    getUris(): string[];
    /**
     * Get total count of diagnostics across all files.
     */
    getTotalCount(): number;
    /**
     * Get summary of diagnostics across all files.
     */
    getSummary(): {
        errors: number;
        warnings: number;
        info: number;
        hints: number;
    };
}
/**
 * Create a diagnostics cache instance.
 */
export declare function createDiagnosticsCache(): IDiagnosticsCache;
//# sourceMappingURL=diagnostics-cache.d.ts.map