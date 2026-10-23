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
 * URI and file path utilities for LSP communication.
 *
 * LSP uses file:// URIs for document identification.
 * This module handles conversion and normalization.
 */
/**
 * Convert a file path to a file:// URI.
 *
 * @param filePath - Absolute file path
 * @returns file:// URI
 */
export declare function pathToUri(filePath: string): string;
/**
 * Convert a file:// URI to a file path.
 *
 * @param uri - file:// URI
 * @returns Absolute file path
 */
export declare function uriToPath(uri: string): string;
/**
 * Convert an absolute local file URI at a trust boundary.
 *
 * Unlike uriToPath(), this rejects authorities other than localhost, URI
 * decorations, malformed escapes, and non-absolute results before returning a
 * filesystem path. Callers must still perform their own containment check.
 */
export declare function strictFileUriToPath(uri: string): string;
/**
 * Normalize a file path by resolving symlinks and normalizing the path.
 *
 * @param filePath - File path to normalize
 * @returns Normalized absolute path
 */
export declare function normalizePath(filePath: string): string;
/**
 * Get the file extension from a path (lowercase, with dot).
 *
 * @param filePath - File path
 * @returns Extension including dot (e.g., ".ts") or empty string
 */
export declare function getExtension(filePath: string): string;
/**
 * Check if a file is likely binary based on extension.
 *
 * @param filePath - File path to check
 * @returns true if the file extension indicates a binary file
 */
export declare function isBinaryExtension(filePath: string): boolean;
/**
 * Check if a file is binary by looking for null bytes.
 *
 * @param filePath - File path to check
 * @returns true if the file appears to be binary
 */
export declare function isBinaryFile(filePath: string): Promise<boolean>;
/**
 * Check if a file exists and is readable.
 *
 * @param filePath - File path to check
 * @returns true if file exists and is readable
 */
export declare function isReadable(filePath: string): Promise<boolean>;
/**
 * Check if a path is a file (not a directory).
 *
 * @param filePath - Path to check
 * @returns true if path is a file
 */
export declare function isFile(filePath: string): Promise<boolean>;
/**
 * Check if a path is a directory.
 *
 * @param dirPath - Path to check
 * @returns true if path is a directory
 */
export declare function isDirectory(dirPath: string): Promise<boolean>;
/**
 * Read a file's content as UTF-8 text.
 *
 * @param filePath - Path to the file
 * @returns File content as string
 * @throws LSPError if file cannot be read
 */
export declare function readFile(filePath: string): Promise<string>;
/**
 * Get the directory containing a file.
 *
 * @param filePath - File path
 * @returns Directory path
 */
export declare function getDirectory(filePath: string): string;
/**
 * Join path segments.
 *
 * @param segments - Path segments to join
 * @returns Joined path
 */
export declare function joinPath(...segments: string[]): string;
/**
 * Check if a path is absolute.
 *
 * @param filePath - Path to check
 * @returns true if path is absolute
 */
export declare function isAbsolute(filePath: string): boolean;
/**
 * Ensure a path is absolute, resolving relative paths against cwd.
 *
 * @param filePath - Path to make absolute
 * @returns Absolute path
 */
export declare function ensureAbsolute(filePath: string): string;
/**
 * Get the relative path from one location to another.
 *
 * @param from - Starting path
 * @param to - Target path
 * @returns Relative path from 'from' to 'to'
 */
export declare function relativePath(from: string, to: string): string;
/**
 * Check if a path is within a directory (accounting for symlinks).
 *
 * @param filePath - Path to check
 * @param dirPath - Directory path
 * @returns true if filePath is within dirPath
 */
export declare function isWithinDirectory(filePath: string, dirPath: string): boolean;
/**
 * Validate that a file path is within a workspace root before writing.
 * Throws LSPError if the path is outside the workspace.
 *
 * @param filePath - File path to validate
 * @param workspaceRoot - Workspace root path
 * @throws LSPError if path is outside workspace
 */
export declare function validatePathWithinWorkspace(filePath: string, workspaceRoot: string): void;
//# sourceMappingURL=uri.d.ts.map