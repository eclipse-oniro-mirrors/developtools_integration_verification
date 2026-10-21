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
import type { WorkspaceConfigurationMap, WorkspaceSettings } from '../types.js';
/**
 * Validate the JSON shape used for exact-root workspace settings.
 */
export declare function isWorkspaceConfigurationMap(value: unknown): value is WorkspaceConfigurationMap;
/**
 * Select settings only when the normalized server root exactly matches a
 * configured root. Descendant matching is intentionally not used here because
 * each language-server process is owned by one exact workspace root.
 */
export declare function getWorkspaceSettings(configurations: WorkspaceConfigurationMap | undefined, workspaceRoot: string): WorkspaceSettings | undefined;
/**
 * Resolve an LSP configuration section from a workspace settings object.
 * Literal keys take precedence over dotted traversal so both common client
 * storage layouts can be represented without language-specific code.
 */
export declare function resolveWorkspaceSection(settings: WorkspaceSettings, section: string | undefined): unknown;
//# sourceMappingURL=workspace-settings.d.ts.map