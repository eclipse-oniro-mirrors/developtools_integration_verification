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
import { type ServerCapabilities, type InitializeResult, type TextDocumentItem, type TextDocumentContentChangeEvent, type Position, type Location, type LocationLink, type Hover, type SignatureHelp, type DocumentSymbol, type SymbolInformation, type WorkspaceSymbol, type CompletionList, type CompletionItem, type WorkspaceEdit, type Diagnostic, type Range, type CodeAction, type Command, type CallHierarchyItem, type CallHierarchyIncomingCall, type CallHierarchyOutgoingCall, type TypeHierarchyItem, type TextEdit, type FormattingOptions, type DocumentHighlight, type InlayHint, type SelectionRange, type FoldingRange } from 'vscode-languageserver-protocol';
import type { LSPClient as ILSPClient, LSPServerConfig } from '../types.js';
type DiagnosticsHandler = (uri: string, diagnostics: Diagnostic[]) => void;
type ErrorHandler = (error: Error) => void;
type ExitHandler = (code: number | null) => void;
/**
 * LSP Client implementation that wraps communication with a language server.
 */
export declare class LSPClientImpl implements ILSPClient {
    private readonly config;
    private readonly timeout;
    private process;
    private connection;
    private _capabilities;
    private _isInitialized;
    private _workspaceRoot;
    private pendingRequests;
    private diagnosticsCache;
    private diagnosticsHandlers;
    private errorHandlers;
    private exitHandlers;
    private _nextRequestId;
    /** Work-done progress tokens the server has open, with the time each started */
    private activeProgress;
    /** When the server last published diagnostics for each URI (push model only) */
    private diagnosticsPublishedAt;
    /** Last published diagnostics per URI (push model) */
    private pushedDiagnostics;
    /** Last pulled diagnostics and their resultId, per URI (pull model) */
    private pulledDiagnostics;
    constructor(config: LSPServerConfig, timeout?: number);
    get capabilities(): ServerCapabilities;
    get isInitialized(): boolean;
    get workspaceRoot(): string;
    get serverId(): string;
    /**
     * Initialize the language server.
     */
    initialize(rootUri: string): Promise<InitializeResult>;
    /**
     * Shutdown the language server gracefully.
     */
    shutdown(): Promise<void>;
    /**
     * Exit the language server process.
     */
    exit(): void;
    didOpen(document: TextDocumentItem): void;
    didChange(uri: string, version: number, changes: TextDocumentContentChangeEvent[]): void;
    didClose(uri: string): void;
    /**
     * Whether the server provides diagnostics on request (textDocument/diagnostic).
     * Some servers, e.g. the TypeScript 7 native server, only report errors this way
     * and publish empty diagnostics. The client does not advertise pull support, so
     * servers that switch models based on it (e.g. pyright) keep pushing.
     */
    supportsPullDiagnostics(): boolean;
    /**
     * Request diagnostics for a document from a pull-model server and store them
     * like published ones. Returns null if the server does not support pulling or
     * the request failed, so callers can fall back to cached diagnostics.
     */
    pullDiagnostics(uri: string): Promise<Diagnostic[] | null>;
    /** Whether the last diagnostics the server published for `uri` were non-empty */
    hasPushedDiagnostics(uri: string): boolean;
    didSave(uri: string): void;
    /**
     * Wait until the server publishes diagnostics for `uri` at or after `since`.
     * Returns false if none arrive within `maxMs`.
     */
    waitForDiagnostics(uri: string, since: number, maxMs: number): Promise<boolean>;
    didDeleteFiles(uris: string[]): void;
    definition(uri: string, position: Position): Promise<Location | Location[] | LocationLink[] | null>;
    typeDefinition(uri: string, position: Position): Promise<Location | Location[] | LocationLink[] | null>;
    references(uri: string, position: Position, includeDeclaration: boolean): Promise<Location[] | null>;
    implementation(uri: string, position: Position): Promise<Location | Location[] | LocationLink[] | null>;
    hover(uri: string, position: Position): Promise<Hover | null>;
    signatureHelp(uri: string, position: Position): Promise<SignatureHelp | null>;
    documentSymbols(uri: string): Promise<DocumentSymbol[] | SymbolInformation[] | null>;
    workspaceSymbols(query: string): Promise<SymbolInformation[] | WorkspaceSymbol[] | null>;
    completion(uri: string, position: Position): Promise<CompletionList | CompletionItem[] | null>;
    prepareRename(uri: string, position: Position): Promise<Range | {
        range: Range;
        placeholder: string;
    } | null>;
    rename(uri: string, position: Position, newName: string): Promise<WorkspaceEdit | null>;
    codeActions(uri: string, range: Range, diagnostics: Diagnostic[], kinds?: string[]): Promise<(CodeAction | Command)[] | null>;
    prepareCallHierarchy(uri: string, position: Position): Promise<CallHierarchyItem[] | null>;
    callHierarchyIncomingCalls(item: CallHierarchyItem): Promise<CallHierarchyIncomingCall[] | null>;
    callHierarchyOutgoingCalls(item: CallHierarchyItem): Promise<CallHierarchyOutgoingCall[] | null>;
    prepareTypeHierarchy(uri: string, position: Position): Promise<TypeHierarchyItem[] | null>;
    typeHierarchySupertypes(item: TypeHierarchyItem): Promise<TypeHierarchyItem[] | null>;
    typeHierarchySubtypes(item: TypeHierarchyItem): Promise<TypeHierarchyItem[] | null>;
    formatDocument(uri: string, options: FormattingOptions): Promise<TextEdit[] | null>;
    documentHighlight(uri: string, position: Position): Promise<DocumentHighlight[] | null>;
    inlayHints(uri: string, range: Range): Promise<InlayHint[] | null>;
    selectionRange(uri: string, positions: Position[]): Promise<SelectionRange[] | null>;
    foldingRanges(uri: string): Promise<FoldingRange[] | null>;
    cancelRequest(id: number | string): void;
    getCachedDiagnostics(uri: string): Diagnostic[];
    onDiagnostics(handler: DiagnosticsHandler): void;
    onError(handler: ErrorHandler): void;
    onExit(handler: ExitHandler): void;
    private setupNotificationHandlers;
    private sendRequest;
    /**
     * Send a request with the configured timeout. Unlike sendRequest, this does
     * not require the server to be initialized, so initialize itself can use it.
     */
    private sendRequestWithTimeout;
    private ensureConnection;
    private ensureCapability;
    private notifyError;
    private notifyExit;
    /**
     * Send the initialize request, failing on timeout or if the server process
     * exits first, instead of waiting forever for a server that never answers.
     */
    private initializeOrFail;
    /**
     * Track work-done progress the server reports (e.g. project loading or
     * indexing), so callers can wait for work triggered by opening a document.
     */
    private registerProgressTracking;
    /**
     * Wait until work the server started at or after `since` has finished.
     *
     * Always waits at least `windowMs` after `since`, so progress the server
     * starts shortly after a didOpen is seen, and never longer than `maxMs`.
     * Progress that began before `since` (e.g. long-running background
     * indexing) is ignored.
     */
    waitForServerWork(since: number, windowMs: number, maxMs: number): Promise<void>;
    /**
     * The diagnostics for a URI from both models, without duplicates. Some servers
     * use both: rust-analyzer returns its own diagnostics on request but still
     * pushes cargo check results, while TypeScript 7 only pushes empty lists.
     */
    private mergedDiagnostics;
    /**
     * Store the effective diagnostics for a URI and notify listeners.
     */
    private storeDiagnostics;
    private cleanup;
    private getInstallCommand;
    /**
     * Get the process ID of the language server.
     */
    getPid(): number | null;
}
/**
 * Create a new LSP client instance.
 */
export declare function createLSPClient(config: LSPServerConfig, timeout?: number): ILSPClient;
export {};
//# sourceMappingURL=lsp-client.d.ts.map