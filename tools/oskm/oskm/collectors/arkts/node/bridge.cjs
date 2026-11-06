'use strict';
// Copyright (c) 2026 Huawei Device Co., Ltd. SPDX-License-Identifier: Apache-2.0
const crypto = require('node:crypto');
const {once} = require('node:events');
const lock = require('./backend-lock.json');
const {load} = require('./frontends/ohos_ts.cjs');
const {Engine, IR_VERSION} = require('./core/engine.cjs');
const LIMITS = {file_bytes: 8*1024*1024, request_bytes: 12*1024*1024, response_bytes: 4*1024*1024,
  tag_bytes: 16384, references: 20000, diagnostics: 100, depth: 128};
async function send(value) {
  let line = JSON.stringify(value) + '\n';
  if (Buffer.byteLength(line) > LIMITS.response_bytes) throw new Error('RESULT_FRAME_LIMIT');
  if (!process.stdout.write(line)) await once(process.stdout, 'drain');
}
async function main() {
  const frontend = load(process.argv[2], lock), engine = new Engine(frontend);
  await send({type: 'ready', protocol_version: lock.protocol_version, ir_schema_version: IR_VERSION,
    adapter_version: lock.adapter_version, node_version: process.version, backend: frontend.identity,
    profiles: Object.keys(engine.manifests), capabilities: engine.capabilities()});
  let pending = Buffer.alloc(0);
  for await (const chunk of process.stdin) {
    pending = Buffer.concat([pending, chunk]);
    if (pending.length > LIMITS.request_bytes) throw new Error('REQUEST_FRAME_LIMIT');
    let newline;
    while ((newline = pending.indexOf(10)) >= 0) {
      const line = pending.subarray(0, newline); pending = pending.subarray(newline+1);
      const request = JSON.parse(new TextDecoder('utf-8', {fatal: true}).decode(line));
      if (!Number.isSafeInteger(request.id) || request.id < 1) throw new Error('INVALID_ID');
      if (request.type === 'shutdown') { await send({type: 'closed', id: request.id}); return; }
      if (request.type !== 'parse' || typeof request.path !== 'string' || request.path.length > 4096 ||
          typeof request.content_b64 !== 'string' || !Number.isInteger(request.byte_length) ||
          request.byte_length < 0 || request.byte_length > LIMITS.file_bytes) throw new Error('INVALID_REQUEST');
      const bytes = Buffer.from(request.content_b64, 'base64');
      if (bytes.toString('base64') !== request.content_b64 || bytes.length !== request.byte_length ||
          crypto.createHash('sha256').update(bytes).digest('hex') !== request.sha256) throw new Error('INPUT_MISMATCH');
      const text = new TextDecoder('utf-8', {fatal: true, ignoreBOM: true}).decode(bytes);
      const limits = {...LIMITS};
      if (request.limits !== undefined) {
        if (!request.limits || Object.keys(request.limits).some(k => !['depth', 'references'].includes(k))) throw new Error('INVALID_LIMITS');
        for (const [name, value] of Object.entries(request.limits)) {
          if (!Number.isInteger(value) || value < 1 || value > LIMITS[name]) throw new Error('INVALID_LIMITS');
          limits[name] = value;
        }
      }
      const result = engine.parse(request, text, limits);
      await send({type: 'result', id: request.id, path: request.path, sha256: request.sha256,
        profile: request.profile, ir_schema_version: IR_VERSION, ...result});
    }
  }
  if (pending.length) throw new Error('TRUNCATED_REQUEST');
}
main().catch(async error => {
  process.stderr.write(String(error.stack || error).slice(0, 8192) + '\n');
  try { await send({type: 'fatal', code: error.message}); } catch (_) { /* pipe may already be closed */ }
  process.exitCode = 1;
});
