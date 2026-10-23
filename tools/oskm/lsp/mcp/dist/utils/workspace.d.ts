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
/**
 * Find the workspace root by walking up from a file path.
 *
 * @param filePath - Starting file path
 * @param markers - Root marker patterns (defaults to DEFAULT_ROOT_MARKERS)
 * @returns Workspace root path, or the file's directory if no root found
 */
export declare function findWorkspaceRoot(filePath: string, markers?: string[]): Promise<string>;
/**
 * Find the workspace root using specific markers for a language server.
 *
 * Markers are tried in priority order: for the first marker, walk up from the
 * file and return the nearest directory that contains it; only if no ancestor
 * contains it, try the next marker, and so on. This lets a project-level marker
 * (e.g. a root compile_commands.json) win over lower-priority markers that also
 * appear in subdirectories (e.g. a CMakeLists.txt in every source folder).
 *
 * @param filePath - Starting file path
 * @param rootPatterns - Language-specific root patterns, highest priority first
 * @returns Workspace root path
 */
export declare function findWorkspaceRootForLanguage(filePath: string, rootPatterns?: string[]): Promise<string>;
/**
 * Find the innermost workspace root (closest to the file).
 *
 * Unlike findWorkspaceRoot which finds the outermost root,
 * this finds the closest project root to the file.
 * Useful for monorepos where you want the sub-project root.
 *
 * @param filePath - Starting file path
 * @param markers - Root marker patterns
 * @returns Innermost workspace root path
 */
export declare function findInnermostRoot(filePath: string, markers?: string[]): Promise<string>;
/**
 * Create a unique key for a server instance based on language and workspace root.
 *
 * @param serverId - Server/language ID
 * @param workspaceRoot - Workspace root path
 * @returns Unique key string
 */
export declare function createServerKey(serverId: string, workspaceRoot: string): string;
/**
 * Parse a server key back into its components.
 *
 * @param key - Server key
 * @returns Object with serverId and workspaceRoot
 */
export declare function parseServerKey(key: string): {
    serverId: string;
    workspaceRoot: string;
};
/**
 * Check if a file belongs to a workspace.
 *
 * @param filePath - File path to check
 * @param workspaceRoot - Workspace root path
 * @returns true if the file is within the workspace
 */
export declare function isFileInWorkspace(filePath: string, workspaceRoot: string): boolean;
/**
 * Get all potential workspace roots between a file and a limit directory.
 *
 * @param filePath - Starting file path
 * @param markers - Root marker patterns
 * @param limitDir - Stop searching at this directory (optional)
 * @returns Array of workspace root paths (innermost to outermost)
 */
export declare function findAllWorkspaceRoots(filePath: string, markers?: string[], limitDir?: string): Promise<string[]>;
//# sourceMappingURL=workspace.d.ts.map