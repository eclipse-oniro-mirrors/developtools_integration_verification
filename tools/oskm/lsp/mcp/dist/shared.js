// Copyright (c) 2026 Huawei Device Co., Ltd.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// One MCP worker per canonical workspace/configuration. Each stdio client gets
// its own MCP session; only tool operations reach the shared worker.
import net from 'node:net';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { createHash } from 'node:crypto';
import { spawn } from 'node:child_process';
import { promises as fs, openSync, closeSync } from 'node:fs';
import { Client } from '@modelcontextprotocol/sdk/client/index.js';
import { StdioClientTransport } from '@modelcontextprotocol/sdk/client/stdio.js';
import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { CallToolRequestSchema, ListToolsRequestSchema } from '@modelcontextprotocol/sdk/types.js';
import { loadConfig } from './config.js';

const here = fileURLToPath(import.meta.url);
const entry = path.join(path.dirname(here), 'index.js');
const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));
const report = message => process.stderr.write(`[lsp-shared] ${message}\n`);

async function identity() {
    const root = await fs.realpath(process.cwd());
    process.chdir(root);
    const config = await loadConfig();
    // A different product, executable or effective config needs its own worker.
    const key = createHash('sha256').update(JSON.stringify({
        root, entry: await fs.realpath(entry), config, revision: 1,
    })).digest('hex').slice(0, 24);
    const directory = path.join(os.tmpdir(), `oskm-lsp-${process.getuid()}`);
    await fs.mkdir(directory, { mode: 0o700 }).catch(error => {
        if (error.code !== 'EEXIST') throw error;
    });
    const stat = await fs.lstat(directory);
    if (!stat.isDirectory() || stat.uid !== process.getuid() || (stat.mode & 0o077)) {
        throw new Error(`Shared runtime directory must be private and owned by this user: ${directory}`);
    }
    return { root, config, socket: path.join(directory, `${key}.sock`),
        lock: path.join(directory, `${key}.lock`), log: path.join(directory, `${key}.log`) };
}

function connect(socketPath) {
    return new Promise((resolve, reject) => {
        const socket = net.createConnection(socketPath);
        socket.once('error', reject);
        socket.once('connect', () => {
            socket.off('error', reject);
            resolve(socket);
        });
    });
}

export async function runProxy() {
    const state = await identity();
    let socket;
    try {
        socket = await connect(state.socket);
    }
    catch (error) {
        if (!['ENOENT', 'ECONNREFUSED'].includes(error.code)) throw error;
        // flock holds an OS lock for the daemon's whole lifetime. A loser exits
        // without touching the socket; stale sockets are removed by the winner.
        let launchError;
        const launch = () => {
            const output = openSync(state.log, 'a', 0o600);
            const child = spawn('flock', ['--exclusive', '--nonblock', '--no-fork', '--conflict-exit-code', '73',
                state.lock, process.execPath, here, '--daemon', state.socket], {
                cwd: state.root, env: process.env, detached: true,
                stdio: ['ignore', output, output],
            });
            closeSync(output);
            child.on('error', error => { launchError = error; });
            child.on('exit', code => {
                if (code !== 73) launchError = new Error(`Shared MCP exited during startup; inspect ${state.log}`);
            });
            child.unref();
        };
        launch();
        let nextLaunch = Date.now() + 1000;
        const deadline = Date.now() + Math.max(30000, state.config.requestTimeout);
        while (!socket) {
            if (launchError) throw launchError;
            try {
                socket = await connect(state.socket);
            }
            catch (error) {
                if (!['ENOENT', 'ECONNREFUSED'].includes(error.code)) throw error;
                if (Date.now() > deadline) {
                    throw new Error(`Shared MCP failed to start; inspect ${state.log}`);
                }
                // The previous owner may be releasing its lock after closing
                // its listener. Re-contend rather than waiting for a dead owner.
                if (Date.now() >= nextLaunch) {
                    launch();
                    nextLaunch = Date.now() + 1000;
                }
                await sleep(100);
            }
        }
    }
    report(`connected to ${state.socket}`);
    // Proxy bytes, not JSON-RPC IDs: each socket has its own SDK Server session.
    process.stdin.pipe(socket);
    socket.pipe(process.stdout);
    const finish = code => { socket.destroy(); process.exit(code); };
    process.stdin.once('end', () => finish(0));
    process.stdin.once('error', () => finish(1));
    process.stdout.once('error', () => finish(1));
    socket.once('error', error => { report(error.message); finish(1); });
    socket.once('close', () => finish(0));
    process.once('SIGTERM', () => finish(0));
    process.once('SIGINT', () => finish(0));
}

async function runDaemon() {
    const state = await identity();
    if (process.argv[3] !== state.socket) {
        throw new Error('MCP configuration changed during startup; reconnect the client');
    }
    const backend = new Client({ name: 'oskm-shared-owner', version: '1.0.0' });
    const transport = new StdioClientTransport({
        command: process.execPath, args: [entry, '--shared-worker'], cwd: state.root,
        env: Object.fromEntries(Object.entries(process.env).filter(([, value]) => value !== undefined)),
        stderr: 'inherit',
    });
    const sessions = new Set();
    let stopping = false;
    let activeCalls = 0;
    let idleTimer;
    const idleMs = Number(process.env.OSKM_LSP_IDLE_MS ?? 300000);
    if (!Number.isFinite(idleMs) || idleMs < 1) throw new Error('Invalid OSKM_LSP_IDLE_MS');
    const listener = net.createServer();
    const shutdown = async (code = 0) => {
        if (stopping) return;
        stopping = true;
        clearTimeout(idleTimer);
        listener.close();
        for (const session of sessions) session.close().catch(() => {});
        await backend.close().catch(() => {});
        await fs.unlink(state.socket).catch(() => {});
        process.exit(code);
    };
    const resetIdle = () => {
        clearTimeout(idleTimer);
        if (!stopping && sessions.size === 0 && activeCalls === 0) {
            idleTimer = setTimeout(shutdown, idleMs);
        }
    };
    process.once('SIGTERM', () => shutdown());
    process.once('SIGINT', () => shutdown());
    backend.onclose = () => shutdown(1);
    try {
        await backend.connect(transport, { timeout: state.config.requestTimeout });
        await fs.unlink(state.socket).catch(error => {
            if (error.code !== 'ENOENT') throw error;
        });
        listener.on('connection', socket => {
            if (stopping) { socket.destroy(); return; }
            // Distinct sessions isolate initialize, IDs and cancellation. Tool
            // state and clangd processes belong exclusively to the backend.
            const session = new Server(backend.getServerVersion(), {
                capabilities: { tools: {} }, instructions: backend.getInstructions(),
            });
            sessions.add(session);
            resetIdle();
            session.onerror = error => report(error.message);
            session.onclose = () => { sessions.delete(session); resetIdle(); };
            session.setRequestHandler(ListToolsRequestSchema,
                request => backend.listTools(request.params));
            session.setRequestHandler(CallToolRequestSchema, async request => {
                if (request.params.name === 'lsp_stop_server' && sessions.size > 1) {
                    return { isError: true, content: [{ type: 'text', text:
                        'Language server is shared by other connected clients; '
                        + 'disconnect them before stopping it.' }] };
                }
                activeCalls++;
                resetIdle();
                try {
                    // A disconnect cancels this client's reply, not the shared
                    // worker's running edit/query. Keep it counted until done
                    // so the last disconnect cannot reap work still in flight.
                    return await backend.callTool(request.params, undefined, {
                        timeout: state.config.requestTimeout,
                    });
                }
                finally { activeCalls--; resetIdle(); }
            });
            // The SDK's newline stdio transport also works over a duplex Unix
            // socket. Explicitly close the session on EOF (SDK ignores EOF).
            const wire = new StdioServerTransport(socket, socket);
            socket.once('error', () => socket.destroy());
            socket.once('close', () => session.close().catch(() => {}));
            session.connect(wire).catch(error => { report(error.message); socket.destroy(); });
        });
        listener.on('error', error => { report(error.message); shutdown(1); });
        await new Promise((resolve, reject) => {
            listener.once('error', reject);
            listener.listen(state.socket, resolve);
        });
        report(`owner pid=${process.pid}, worker pid=${transport.pid}, workspace=${state.root}`);
        resetIdle();
    }
    catch (error) {
        report(error.stack ?? error.message);
        await shutdown(1);
    }
}

if (process.argv[1] && path.resolve(process.argv[1]) === here && process.argv[2] === '--daemon') {
    runDaemon().catch(error => { report(error.stack ?? error.message); process.exit(1); });
}
