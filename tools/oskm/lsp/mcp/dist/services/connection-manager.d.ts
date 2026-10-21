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
import type { ConnectionManager as IConnectionManager, LSPClient, ServerInstance, Config, DiagnosticsCache } from '../types.js';
/**
 * Manages multiple LSP client instances, routing requests to the appropriate
 * server based on file language and workspace root.
 */
export declare class ConnectionManagerImpl implements IConnectionManager {
    private readonly config;
    private readonly diagnosticsCache?;
    private servers;
    private restartInfo;
    private idleTimers;
    private initLocks;
    constructor(config?: Config, diagnosticsCache?: DiagnosticsCache | undefined);
    /**
     * Get or create a client for a file path.
     */
    getClientForFile(filePath: string): Promise<LSPClient>;
    /**
     * Get or create a client by explicit language and workspace root.
     */
    getClient(serverId: string, workspaceRoot: string): Promise<LSPClient>;
    /**
     * Manually start a language server.
     */
    startServer(serverId: string, workspaceRoot: string): Promise<LSPClient>;
    /**
     * Stop a language server.
     */
    stopServer(serverId: string, workspaceRoot?: string): Promise<void>;
    /**
     * Stop all language servers.
     */
    shutdownAll(): Promise<void>;
    /**
     * List all active servers.
     */
    listActiveServers(): ServerInstance[];
    /**
     * Detect workspace root for a file path.
     * Note: This is a synchronous fallback. The actual async detection
     * happens in getClientForFile using findWorkspaceRootForLanguage.
     */
    detectWorkspaceRoot(filePath: string, _serverId?: string): string;
    private startServerInternal;
    private setupClientHandlers;
    private shouldRestart;
    private restartServer;
    private stopServerByKey;
    private resetIdleTimer;
}
/**
 * Create a connection manager instance.
 */
export declare function createConnectionManager(config?: Config, diagnosticsCache?: DiagnosticsCache): IConnectionManager;
//# sourceMappingURL=connection-manager.d.ts.map