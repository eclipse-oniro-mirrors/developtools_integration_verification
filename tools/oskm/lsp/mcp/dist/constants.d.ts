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
import type { Config, LSPServerConfig } from './types.js';
export declare const DEFAULT_SERVERS: LSPServerConfig[];
export declare const DEFAULT_CONFIG: Config;
export declare const INSTALL_COMMANDS: Record<string, string>;
/** File extensions that are always considered binary */
export declare const BINARY_EXTENSIONS: Set<string>;
/** Number of bytes to read for binary detection */
export declare const BINARY_CHECK_BYTES = 8192;
/** Maximum file size to read (10 MB) */
export declare const MAX_FILE_SIZE_BYTES: number;
/** Default root markers for workspace detection */
export declare const DEFAULT_ROOT_MARKERS: string[];
/** Maximum number of restart attempts for a crashed server */
export declare const MAX_RESTART_ATTEMPTS = 3;
/** Time window for restart attempts (ms) */
export declare const RESTART_WINDOW_MS = 300000;
/** Base delay for exponential backoff (ms) */
export declare const RESTART_BASE_DELAY_MS = 1000;
/**
 * After opening a document, how long to wait for the server to start work it
 * reports via work-done progress (e.g. project loading), before assuming none.
 */
export declare const SERVER_WORK_SETTLE_MS = 300;
/** Upper bound on waiting for work triggered by opening a document (ms) */
export declare const SERVER_WORK_MAX_WAIT_MS = 15000;
/** After opening or changing a document, how long lsp_diagnostics waits for fresh diagnostics (ms) */
export declare const DIAGNOSTICS_WAIT_MS = 3000;
/** Maximum results for find references */
export declare const MAX_REFERENCES = 500;
/** Default limit for find references */
export declare const DEFAULT_REFERENCES_LIMIT = 100;
/** Maximum results for workspace symbols */
export declare const MAX_WORKSPACE_SYMBOLS = 100;
/** Default limit for workspace symbols */
export declare const DEFAULT_WORKSPACE_SYMBOLS_LIMIT = 50;
/** Maximum completions to return */
export declare const MAX_COMPLETIONS = 50;
/** Default completions limit */
export declare const DEFAULT_COMPLETIONS_LIMIT = 20;
export declare const SYMBOL_KIND_NAMES: Record<number, string>;
export declare const COMPLETION_KIND_NAMES: Record<number, string>;
export declare const DIAGNOSTIC_SEVERITY_NAMES: Record<number, 'error' | 'warning' | 'info' | 'hint'>;
/**
 * Standard code action kinds from LSP specification.
 * Used to filter and categorize available code actions.
 */
export declare const CODE_ACTION_KINDS: {
    /** Empty string means all kinds */
    readonly Empty: "";
    /** Quick fix for diagnostics (errors, warnings) */
    readonly QuickFix: "quickfix";
    /** Base kind for all refactoring actions */
    readonly Refactor: "refactor";
    /** Extract method/function/variable */
    readonly RefactorExtract: "refactor.extract";
    /** Inline method/function/variable */
    readonly RefactorInline: "refactor.inline";
    /** Rewrite (e.g., convert arrow function to regular function) */
    readonly RefactorRewrite: "refactor.rewrite";
    /** Move code to another location */
    readonly RefactorMove: "refactor.move";
    /** Base kind for source actions */
    readonly Source: "source";
    /** Organize imports */
    readonly SourceOrganizeImports: "source.organizeImports";
    /** Fix all auto-fixable issues */
    readonly SourceFixAll: "source.fixAll";
    /** Add missing imports */
    readonly SourceAddMissingImports: "source.addMissingImports";
    /** Remove unused imports */
    readonly SourceRemoveUnusedImports: "source.removeUnusedImports";
    /** Sort imports */
    readonly SourceSortImports: "source.sortImports";
};
/** Array of all code action kinds for validation */
export declare const CODE_ACTION_KIND_VALUES: ("" | "quickfix" | "refactor" | "refactor.extract" | "refactor.inline" | "refactor.rewrite" | "refactor.move" | "source" | "source.organizeImports" | "source.fixAll" | "source.addMissingImports" | "source.removeUnusedImports" | "source.sortImports")[];
export declare const ENV: {
    readonly CONFIG_PATH: "LSP_CONFIG_PATH";
    readonly WORKSPACE_ROOT: "LSP_WORKSPACE_ROOT";
    readonly LOG_LEVEL: "LSP_LOG_LEVEL";
};
//# sourceMappingURL=constants.d.ts.map