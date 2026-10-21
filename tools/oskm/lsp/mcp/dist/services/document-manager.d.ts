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
import type { DocumentManager as IDocumentManager, LSPClient } from '../types.js';
/**
 * Manages document synchronization with language servers.
 *
 * Open state is tracked per client *instance*, not per server id: the same
 * server id can run several instances (one per workspace root), and a crashed
 * or stopped server is replaced by a new client object. Each instance must
 * receive its own didOpen, so documents are keyed by the client object itself.
 * A WeakMap lets state for discarded clients be garbage-collected.
 */
export declare class DocumentManagerImpl implements IDocumentManager {
    private documentsByClient;
    private clientIds;
    private nextClientId;
    private latestContent;
    private versionCounters;
    private openLocks;
    /**
     * Open a document with a specific client instance.
     */
    openDocument(uri: string, client: LSPClient): Promise<void>;
    /**
     * Ensure a document is open (idempotent).
     */
    ensureOpen(uri: string, client: LSPClient): Promise<void>;
    /**
     * Close a document in a specific client instance.
     */
    closeDocument(uri: string, client: LSPClient): Promise<void>;
    /**
     * Update document content (for unsaved changes).
     */
    updateContent(uri: string, content: string, client: LSPClient): Promise<void>;
    /**
     * If the document is open in this client instance and the file on disk no
     * longer matches what the server has, send the new content. Edits are made
     * outside this server (e.g. by an editor or agent), so without this the
     * server keeps analyzing the content from when the file was first opened.
     */
    syncWithDisk(uri: string, client: LSPClient): Promise<boolean>;
    /**
     * Get the most recently opened or updated content for a URI.
     */
    getContent(uri: string): string | undefined;
    /**
     * Check if document is open in a specific client instance.
     */
    isOpen(uri: string, client: LSPClient): boolean;
    /**
     * List the documents open in a specific client instance.
     */
    getOpenUris(client: LSPClient): string[];
    /**
     * Get current version for a URI.
     */
    getVersion(uri: string): number;
    private openDocumentInternal;
    private docsFor;
    private clientId;
    private getNextVersion;
}
/**
 * Create a document manager instance.
 */
export declare function createDocumentManager(): IDocumentManager;
//# sourceMappingURL=document-manager.d.ts.map