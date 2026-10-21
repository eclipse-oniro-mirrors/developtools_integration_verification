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
import { getToolContext } from './context.js';
/**
 * Get capability names from server capabilities.
 */
function getCapabilityNames(capabilities) {
    const names = [];
    if (capabilities.definitionProvider)
        names.push('definition');
    if (capabilities.typeDefinitionProvider)
        names.push('typeDefinition');
    if (capabilities.referencesProvider)
        names.push('references');
    if (capabilities.implementationProvider)
        names.push('implementation');
    if (capabilities.hoverProvider)
        names.push('hover');
    if (capabilities.signatureHelpProvider)
        names.push('signatureHelp');
    if (capabilities.documentSymbolProvider)
        names.push('documentSymbols');
    if (capabilities.workspaceSymbolProvider)
        names.push('workspaceSymbols');
    if (capabilities.completionProvider)
        names.push('completion');
    if (capabilities.renameProvider)
        names.push('rename');
    if (capabilities.codeActionProvider)
        names.push('codeAction');
    if (capabilities.documentFormattingProvider)
        names.push('formatting');
    if (capabilities.callHierarchyProvider)
        names.push('callHierarchy');
    if (capabilities.typeHierarchyProvider)
        names.push('typeHierarchy');
    if (capabilities.documentHighlightProvider)
        names.push('documentHighlight');
    if (capabilities.inlayHintProvider)
        names.push('inlayHint');
    if (capabilities.selectionRangeProvider)
        names.push('selectionRange');
    if (capabilities.foldingRangeProvider)
        names.push('foldingRange');
    return names;
}
/**
 * Handle lsp_server_status tool call.
 */
export async function handleServerStatus(input) {
    const { server_id } = input;
    const ctx = getToolContext();
    const instances = ctx.connectionManager.listActiveServers();
    // Filter by server_id if specified
    const filtered = server_id
        ? instances.filter(inst => inst.id === server_id)
        : instances;
    const servers = filtered.map(inst => {
        const result = {
            id: inst.id,
            status: inst.status,
        };
        if (inst.pid !== null) {
            result.pid = inst.pid;
        }
        if (inst.workspaceRoot) {
            result.workspace_root = inst.workspaceRoot;
        }
        if (inst.client?.capabilities) {
            result.capabilities = getCapabilityNames(inst.client.capabilities);
        }
        if (inst.startTime !== null) {
            result.uptime_seconds = Math.floor((Date.now() - inst.startTime) / 1000);
        }
        if (inst.restartCount > 0) {
            result.restart_count = inst.restartCount;
        }
        if (inst.lastError !== null) {
            result.last_error = inst.lastError;
        }
        return result;
    });
    return { servers };
}
/**
 * Handle lsp_start_server tool call.
 */
export async function handleStartServer(input) {
    const { server_id, workspace_root } = input;
    const ctx = getToolContext();
    // Start the server
    const client = await ctx.connectionManager.startServer(server_id, workspace_root);
    // Get capabilities
    const capabilityNames = getCapabilityNames(client.capabilities);
    return {
        status: 'started',
        server_id,
        workspace_root,
        capabilities: capabilityNames,
    };
}
/**
 * Handle lsp_stop_server tool call.
 */
export async function handleStopServer(input) {
    const { server_id, workspace_root } = input;
    const ctx = getToolContext();
    // Check if server is running
    const instances = ctx.connectionManager.listActiveServers();
    const matching = instances.filter(inst => {
        if (inst.id !== server_id)
            return false;
        if (workspace_root && inst.workspaceRoot !== workspace_root)
            return false;
        return true;
    });
    const wasRunning = matching.length > 0 && matching.some(inst => inst.status === 'running' || inst.status === 'starting');
    // Stop the server
    await ctx.connectionManager.stopServer(server_id, workspace_root);
    const response = {
        status: 'stopped',
        server_id,
        was_running: wasRunning,
    };
    if (workspace_root) {
        response.workspace_root = workspace_root;
    }
    return response;
}
//# sourceMappingURL=server.js.map