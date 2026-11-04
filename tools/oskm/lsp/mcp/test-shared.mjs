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
import test from 'node:test';
import assert from 'node:assert/strict';
import { promises as fs } from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawn } from 'node:child_process';
import { Client } from '@modelcontextprotocol/sdk/client/index.js';
import { StdioClientTransport } from '@modelcontextprotocol/sdk/client/stdio.js';

const entry = fileURLToPath(new URL('./dist/index.js', import.meta.url));
const sleep = ms => new Promise(resolve => setTimeout(resolve, ms));
async function until(check, timeout = 15000) {
    const deadline = Date.now() + timeout;
    while (Date.now() < deadline) {
        if (await check()) return;
        await sleep(50);
    }
    throw new Error('Timed out waiting for shared service lifecycle');
}
const fakeServer = `
import { appendFileSync } from 'node:fs';
appendFileSync('starts.log', process.pid + '\\n');
const docs = new Map();
let input = Buffer.alloc(0);
function send(id, result) {
    const body = JSON.stringify({jsonrpc:'2.0',id,result});
    process.stdout.write('Content-Length: '+Buffer.byteLength(body)+'\\r\\n\\r\\n'+body);
}
function message(m) {
    if (m.method === 'initialize') send(m.id,{capabilities:{hoverProvider:true}});
    else if (m.method === 'shutdown') send(m.id,null);
    else if (m.method === 'exit') process.exit(0);
    else if (m.method === 'textDocument/didOpen') docs.set(m.params.textDocument.uri,m.params.textDocument.text);
    else if (m.method === 'textDocument/didChange') docs.set(m.params.textDocument.uri,m.params.contentChanges[0].text);
    else if (m.method === 'textDocument/hover') {
        const contents=docs.get(m.params.textDocument.uri);
        setTimeout(()=>send(m.id,{contents:{kind:'plaintext',value:contents}}),contents.includes('slow_value')?1200:350);
    } else if (m.id !== undefined) send(m.id,null);
}
process.stdin.on('data', chunk => {
    input=Buffer.concat([input,chunk]);
    while (true) {
        const split=input.indexOf('\\r\\n\\r\\n');
        if (split<0) return;
        const length=Number(/Content-Length: (\\d+)/i.exec(input.subarray(0,split).toString())[1]);
        if(input.length<split+4+length)return;
        const body=input.subarray(split+4,split+4+length);
        input=input.subarray(split+4+length);
        message(JSON.parse(body));
    }
});
process.stdin.on('end',()=>process.exit(0));
`;

async function fixture(t, binary, idleTimeout = 5000) {
    const root = await fs.mkdtemp(path.join(os.tmpdir(), 'oskm-shared-test-'));
    const clients = [];
    const sockets = new Set();
    await fs.writeFile(path.join(root, 'main.cc'), 'int shared_value = 1;\n');
    await fs.writeFile(path.join(root, 'other.cc'), 'int other_value = 2;\n');
    await fs.writeFile(path.join(root, 'fake-server.mjs'), fakeServer);
    await fs.writeFile(path.join(root, 'compile_commands.json'), JSON.stringify([
        { directory: root, file: path.join(root, 'main.cc'), arguments: ['clang++', '-c', 'main.cc'] },
    ]));
    const config = {
        servers: [{ id: 'cpp', extensions: ['.cc'], languageIds: ['cpp'],
            command: binary ?? process.execPath,
            args: binary ? ['--background-index', '--compile-commands-dir=' + root, '-j=2']
                : [path.join(root, 'fake-server.mjs')],
            rootPatterns: ['.lsp-mcp.json'], warmup: 'main.cc' }],
        requestTimeout: 15000, idleTimeout: binary ? 60000 : idleTimeout, logLevel: 'warn',
    };
    await fs.writeFile(path.join(root, '.lsp-mcp.json'), JSON.stringify(config));
    t.after(async () => {
        await Promise.all(clients.map(({ client }) => client.close().catch(() => {})));
        for (const socket of sockets) {
            await until(async () => !(await fs.stat(socket).catch(() => null)));
        }
        await fs.rm(root, { recursive: true, force: true });
    });
    async function open(cwd = root) {
        const client = new Client({ name: 'sharing-regression', version: '1.0.0' });
        let errors = '';
        const wire = new StdioClientTransport({ command: process.execPath, args: [entry], cwd,
            env: { ...process.env, OSKM_LSP_IDLE_MS: '600' }, stderr: 'pipe' });
        wire.stderr.on('data', chunk => {
            errors += chunk;
            const match = errors.match(/connected to (.+\.sock)/);
            if (match) sockets.add(match[1]);
        });
        clients.push({ client, wire });
        try { await client.connect(wire); }
        catch (error) { throw new Error(errors + '\n' + error.stack); }
        return { client, wire };
    }
    return { root, open, sockets, config };
}
async function status(client) {
    const result = await client.callTool({ name: 'lsp_server_status', arguments: { server_id: 'cpp' } });
    assert.ok(!result.isError, JSON.stringify(result));
    return JSON.parse(result.content[0].text);
}
async function hover(client, root, filename = 'main.cc') {
    const result = await client.callTool({ name: 'lsp_hover', arguments: {
        file_path: path.join(root, filename), line: 1, column: 6,
    } });
    assert.ok(!result.isError, JSON.stringify(result));
    return JSON.stringify(result);
}
function serverPid(result) {
    return result.servers.find(server => server.id === 'cpp').pid;
}

test('concurrent clients share one process, sync edits and survive another client exit', { timeout: 30000 }, async t => {
    const f = await fixture(t, undefined, 150);
    const [a, b, c] = await Promise.all([f.open(), f.open(), f.open()]);
    const results = await Promise.all([hover(a.client, f.root), hover(b.client, f.root, 'other.cc')]);
    assert.match(results[0], /shared_value/);
    assert.match(results[1], /other_value/);
    const [sa, sb] = await Promise.all([status(a.client), status(b.client)]);
    assert.equal(serverPid(sa), serverPid(sb));
    assert.equal((await fs.readFile(path.join(f.root, 'starts.log'), 'utf8')).trim().split('\n').length, 1);
    assert.equal(f.sockets.size, 1);
    const refused = await a.client.callTool({ name: 'lsp_stop_server', arguments: { server_id: 'cpp' } });
    assert.equal(refused.isError, true);
    await a.client.close();
    // Each hover lasts longer than the configured clangd idle timeout. It must
    // not be stopped mid-request or restarted while shared clients use it.
    await fs.writeFile(path.join(f.root, 'main.cc'), 'int updated_value = 3;\n');
    assert.match(await hover(b.client, f.root), /updated_value/);
    assert.equal(serverPid(await status(b.client)), serverPid(sa));
    await b.client.close();
    assert.match(await hover(c.client, f.root), /updated_value/);
});

test('canonical workspace path shares a service; another workspace is isolated', { timeout: 30000 }, async t => {
    const f = await fixture(t);
    const other = await fixture(t);
    const alias = f.root + '-alias';
    await fs.symlink(f.root, alias);
    t.after(() => fs.unlink(alias));
    const [a, b, c] = await Promise.all([f.open(), f.open(alias), other.open()]);
    await Promise.all([hover(a.client, f.root), hover(b.client, f.root), hover(c.client, other.root)]);
    assert.equal(serverPid(await status(a.client)), serverPid(await status(b.client)));
    assert.notEqual(serverPid(await status(a.client)), serverPid(await status(c.client)));
});

test('different effective configurations do not reuse the wrong product', { timeout: 30000 }, async t => {
    const f = await fixture(t);
    const a = await f.open();
    await hover(a.client, f.root);
    f.config.servers[0].args.push('--other-product');
    await fs.writeFile(path.join(f.root, '.lsp-mcp.json'), JSON.stringify(f.config));
    const b = await f.open();
    await hover(b.client, f.root);
    assert.notEqual(serverPid(await status(a.client)), serverPid(await status(b.client)));
    assert.equal(f.sockets.size, 2);
});

test('owner death releases worker/clangd and a stale socket can be recovered', { timeout: 30000 }, async t => {
    const f = await fixture(t);
    const a = await f.open();
    await hover(a.client, f.root);
    const oldPid = serverPid(await status(a.client));
    const socket = [...f.sockets][0];
    const log = await fs.readFile(socket.replace(/\.sock$/, '.log'), 'utf8');
    const ownerPid = Number(log.match(/owner pid=(\d+)/)[1]);
    process.kill(ownerPid, 'SIGKILL');
    await until(async () => {
        const stat = await fs.readFile(`/proc/${oldPid}/stat`, 'utf8').catch(() => null);
        return !stat || stat.slice(stat.lastIndexOf(')') + 2).startsWith('Z');
    });
    const b = await f.open();
    assert.match(await hover(b.client, f.root), /shared_value/);
    assert.notEqual(serverPid(await status(b.client)), oldPid);
});

test('last client disconnect does not reap an operation still running', { timeout: 30000 }, async t => {
    const f = await fixture(t);
    const a = await f.open();
    await hover(a.client, f.root);
    const pid = serverPid(await status(a.client));
    await fs.writeFile(path.join(f.root, 'main.cc'), 'int slow_value = 4;\n');
    const pending = hover(a.client, f.root).catch(() => {});
    await sleep(100);
    await a.client.close();
    await sleep(700); // longer than owner idle grace, shorter than the query
    const b = await f.open();
    await pending;
    assert.equal(serverPid(await status(b.client)), pid);
    assert.match(await hover(b.client, f.root), /slow_value/);
});

test('concurrent queries join one crash restart', { timeout: 30000 }, async t => {
    const f = await fixture(t);
    const [a, b] = await Promise.all([f.open(), f.open()]);
    await hover(a.client, f.root);
    const oldPid = serverPid(await status(a.client));
    process.kill(oldPid, 'SIGKILL');
    await sleep(100);
    await Promise.all([hover(a.client, f.root), hover(b.client, f.root)]);
    const pid = serverPid(await status(a.client));
    assert.notEqual(pid, oldPid);
    assert.equal(serverPid(await status(b.client)), pid);
    assert.equal((await fs.readFile(path.join(f.root, 'starts.log'), 'utf8')).trim().split('\n').length, 2);
});

test('startup retries a predecessor lock that is still being released', { timeout: 30000 }, async t => {
    const f = await fixture(t);
    const a = await f.open();
    await hover(a.client, f.root);
    const socket = [...f.sockets][0];
    await a.client.close();
    await until(async () => !(await fs.stat(socket).catch(() => null)));
    const locker = spawn('flock', [socket.replace(/\.sock$/, '.lock'), process.execPath,
        '-e', 'process.stdout.write("locked"); setTimeout(() => {}, 1200)'], { stdio: ['ignore', 'pipe', 'inherit'] });
    const exited = new Promise(resolve => locker.once('exit', resolve));
    await new Promise((resolve, reject) => { locker.stdout.once('data', resolve); locker.once('error', reject); });
    try {
        const b = await f.open();
        assert.match(await hover(b.client, f.root), /shared_value/);
    }
    finally { locker.kill(); await exited; }
});

const binary = process.env.LSP_TEST_CLANGD;
test('two real clangd clients share one PID and return semantic hover', {
    skip: !binary, timeout: 40000,
}, async t => {
    const f = await fixture(t, binary);
    const [a, b] = await Promise.all([f.open(), f.open()]);
    assert.match(await hover(a.client, f.root), /shared_value/);
    assert.match(await hover(b.client, f.root), /shared_value/);
    const pid = serverPid(await status(a.client));
    assert.equal(pid, serverPid(await status(b.client)));
    t.diagnostic(`independent MCP clients share real clangd PID ${pid}`);
    await a.client.close();
    await fs.writeFile(path.join(f.root, 'main.cc'), 'long updated_value = 3;\n');
    assert.match(await hover(b.client, f.root), /updated_value/);
});

const opencode = process.env.LSP_TEST_OPENCODE;
test('two independent OpenCode backends connect to the same real clangd', {
    skip: !binary || !opencode, timeout: 60000,
}, async t => {
    const f = await fixture(t, binary);
    await fs.writeFile(path.join(f.root, 'opencode.json'), JSON.stringify({
        mcp: { lsp: { type: 'local', command: [process.execPath, entry], enabled: true, timeout: 15000 } },
    }));
    const processes = [];
    async function stop(child) {
        if (child.exitCode !== null || child.signalCode !== null) return;
        const exited = new Promise(resolve => child.once('exit', resolve));
        child.kill('SIGTERM');
        const timer = setTimeout(() => child.kill('SIGKILL'), 3000);
        await exited;
        clearTimeout(timer);
    }
    async function start(number) {
        const env = { ...process.env, OSKM_LSP_IDLE_MS: '600',
            OPENCODE_DISABLE_AUTOUPDATE: 'true', OPENCODE_DISABLE_MODELS_FETCH: 'true' };
        for (const name of ['OPENCODE_CONFIG', 'OPENCODE_CONFIG_CONTENT', 'OPENCODE_CONFIG_DIR',
            'OPENCODE_DISABLE_PROJECT_CONFIG', 'OPENCODE_SERVER_PASSWORD', 'OPENCODE_SERVER_USERNAME']) delete env[name];
        for (const kind of ['CONFIG', 'DATA', 'STATE', 'CACHE']) {
            env[`XDG_${kind}_HOME`] = path.join(f.root, `opencode-${number}-${kind.toLowerCase()}`);
        }
        const child = spawn(opencode, ['serve', '--hostname', '127.0.0.1', '--port', '0', '--pure'], {
            cwd: f.root, env, stdio: ['ignore', 'pipe', 'pipe'],
        });
        processes.push(child);
        let output = '';
        child.stdout.on('data', chunk => { output += chunk; });
        child.stderr.on('data', chunk => { output += chunk; });
        let launchError;
        child.once('error', error => { launchError = error; });
        await until(() => {
            if (launchError) throw launchError;
            if (child.exitCode !== null) throw new Error(output);
            return /http:\/\/127\.0\.0\.1:\d+/.test(output);
        }, 30000);
        return output.match(/http:\/\/127\.0\.0\.1:\d+/)[0];
    }
    try {
        const urls = await Promise.all([start(1), start(2)]);
        const statuses = await Promise.all(urls.map(async url => {
            const response = await fetch(url + '/mcp?directory=' + encodeURIComponent(f.root), {
                signal: AbortSignal.timeout(20000),
            });
            assert.equal(response.status, 200);
            return response.json();
        }));
        for (const result of statuses) assert.equal(result.lsp.status, 'connected', JSON.stringify(result));
        const probe = await f.open();
        assert.match(await hover(probe.client, f.root), /shared_value/);
        const pid = serverPid(await status(probe.client));
        // Every owner logs its identity before clients can finish initialize.
        const log = await fs.readFile([...f.sockets][0].replace(/\.sock$/, '.log'), 'utf8');
        assert.equal((log.match(/owner pid=/g) ?? []).length, 1);
        t.diagnostic(`OpenCode PIDs ${processes.map(child => child.pid).join(', ')} share clangd PID ${pid}`);
        await stop(processes[0]);
        assert.match(await hover(probe.client, f.root), /shared_value/);
        assert.equal(serverPid(await status(probe.client)), pid);
        const response = await fetch(urls[1] + '/mcp?directory=' + encodeURIComponent(f.root));
        assert.equal((await response.json()).lsp.status, 'connected');
    }
    finally { await Promise.all(processes.map(stop)); }
});
