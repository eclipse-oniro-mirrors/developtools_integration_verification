'use strict';
const test = require('node:test');
const assert = require('node:assert/strict');
const path = require('node:path');
const {load} = require('../frontends/ohos_ts.cjs');
const {Engine} = require('../core/engine.cjs');
const {Registry} = require('../core/registry.cjs');
const {convertSpans} = require('../core/positions.cjs');
const lock = require('../backend-lock.json');
const frontend = load(process.env.OSKM_TYPESCRIPT_ROOT || path.resolve('../../../interface/sdk-js/build-tools/node_modules/typescript'), lock);
const engine = new Engine(frontend);
const limits = {tag_bytes: 16384, references: 20000, diagnostics: 100, depth: 128};
const request = (role='kit', name='kits/@kit.Test.d.ts') => ({profile:'module_kit_v1', ir_schema_version:'1.0.0', file_role:role, path:name});
const parse = (text, role='kit', name) => engine.parse(request(role, name), text, limits);
const header = '/** @file test\n * @kit Test\n */\n';

test('P1 module path never requests an AST or exports body API facts', () => {
  const noAst = {context(...args) { const ctx = frontend.context(...args); ctx.ast = () => {throw Error('BODY_PARSED');}; return ctx; }};
  const result = new Engine(noAst).parse(request('module'), header + 'export @interface Retention {}', limits);
  assert.equal(result.facts['file.header'].tags[1].value, 'Test');
  assert.deepEqual(Object.keys(result.facts), ['file.header']);
  assert.equal(result.coverage['kit.references'].status, 'not_requested');
});
test('header stops before the first import and ignores fenced tags', () => {
  const text = '/**\n * @file a\n * ```ts\n * @kit Fake\n * ```\n * @kit Test\n */\n' +
    'import x from "./x";\n/** @file later\n * @kit Later\n */';
  const result = parse(text, 'module');
  assert.deepEqual(result.facts['file.header'].tags.filter(t=>t.name==='kit').map(t=>t.value), ['Test']);
  assert.equal(result.facts['file.header'].span[1], text.indexOf('import'));
});
test('duplicate blocks preserve evidence and orphan tags are candidates', () => {
  const result = parse(header + header, 'module');
  assert.equal(result.facts['file.header'].tags.filter(t=>t.name==='kit').length, 2);
  const orphan = parse('/** @kit Test */\ndeclare class A {}', 'module');
  assert.equal(orphan.facts['file.header'].status, 'partial');
  assert.equal(orphan.facts['file.header'].tags[0].evidence_state, 'candidate');
});
test('a different fence delimiter cannot expose example tags', () => {
  const result = parse('/**\n * @file x\n * ````ts\n * ~~~\n * @kit Fake\n * ```\n * @kit AlsoFake\n * ````\n * @kit Test\n */', 'module');
  assert.deepEqual(result.facts['file.header'].tags.filter(t=>t.name==='kit').map(t=>t.value), ['Test']);
});
test('AST references include type, side effect and reexports, never local export names', () => {
  const text = header + `import type { X, Y as Z }\n from '@ohos.x'\nimport './side';\nexport * from './all';\nexport {X};\nexport * as ns from './ns';\nexport type {T} from './types';`;
  const result = parse(text);
  assert.equal(result.coverage['kit.references'].status, 'complete');
  assert.deepEqual(result.facts['kit.references'].map(r=>r.specifier), ['@ohos.x','./side','./all','./ns','./types']);
  assert.equal(result.facts['kit.references'][1].statement_kind, 'side_effect_import');
});
test('string escapes are compiler decoded and raw literal span remains exact', () => {
  const text = header + String.raw`import x from '@ohos.\u0078';`;
  const ref = parse(text).facts['kit.references'][0];
  assert.equal(ref.specifier, '@ohos.x');
  assert.equal(Buffer.from(text).subarray(...ref.target_span).toString(), String.raw`'@ohos.\u0078'`);
});
test('syntax recovery nodes are rejected while header survives', () => {
  const result = parse(header + 'import x from "@ohos.x"; import { broken');
  assert.equal(result.coverage['kit.references'].status, 'failed');
  assert.equal(result.facts['kit.references'].length, 0);
  assert.equal(result.facts['file.header'].status, 'ok');
  assert.equal(result.coverage['condition.top_level'].status, 'failed');
});
test('an escaped unpaired surrogate is unsupported source evidence, not broken transport', () => {
  const result = parse(String.raw`import x from './\uD800'; import y from 'y';`);
  assert.equal(result.coverage['kit.references'].status,'partial');
  assert.equal(result.facts['kit.references'][0].specifier,null);
  assert.equal(result.facts['kit.references'][1].specifier,'y');
});
test('import equals is explicit unsupported evidence; static references survive', () => {
  const result = parse('import x = require("x"); import y from "y";');
  assert.equal(result.coverage['kit.references'].status, 'partial');
  assert.equal(result.facts['kit.references'][0].statement_kind, 'unsupported');
  assert.equal(result.facts['kit.references'][1].specifier, 'y');
});
test('nested conditions, unclosed blocks and unknown branches retain uncertainty', () => {
  const result = parse('/*** if arkts dynamic&static */\nimport a from "a";\n/*** if arkts static */\nimport b from "b";\n/*** endif */\n/*** endif */\nimport c from "c";');
  assert.deepEqual(result.facts['condition.top_level'].references.map(r=>r.condition_state), ['both','static','unspecified']);
  for (const tail of ['', '\n/*** else */\nimport y from "y";\n/*** endif */']) {
    const broken = parse('/*** if arkts dynamic */\nimport x from "x";' + tail);
    assert.ok(broken.facts['condition.top_level'].references.every(r=>r.condition_state==='unknown'));
  }
});
test('conditions inside strings/templates and opaque declarations are not directives', () => {
  const result = parse('declare const text: "/* import x from fake */";\n' +
    'const template = `/*** if arkts static */`;\nconst regex = /abc/;\nimport x from "x";');
  assert.equal(result.facts['condition.top_level'].directives.length, 0);
  assert.equal(result.facts['condition.top_level'].references[0].condition_state, 'unspecified');
});
test('cross-statement conditions and conflicting suffix constraints become unknown', () => {
  const result = parse('import /*** if arkts static */ x from "x";');
  assert.equal(result.facts['condition.top_level'].references[0].condition_state, 'unknown');
  const conflict = parse('/*** if arkts dynamic */\nimport x from "x";\n/*** endif */', 'kit','kits/@kit.Test.static.d.ets');
  assert.equal(conflict.facts['condition.top_level'].references[0].condition_state, 'unknown');
});
test('use static, BOM, Chinese, emoji and CRLF retain byte spans', () => {
  const text = '\ufeff\'use static\';\r\n/** 中文😀 */\r\nimport x from "x";';
  const result = parse(text);
  assert.equal(result.facts['file.header'].file_condition, 'static');
  const ref = result.facts['kit.references'][0];
  assert.equal(Buffer.from(text).subarray(...ref.statement_span).toString(), 'import x from "x";');
  assert.throws(()=>convertSpans('😀', {span:[1,2]}), /SURROGATE_SPLIT/);
});
test('E-01 new extractor only changes registration/profile/schema, not engine or bridge', () => {
  const extra = {id:'test.fact',version:'1.0.0',requires:[],validate:v=>v.label==='extension',
    run:()=>({status:'complete',facts:{label:'extension',span:[0,1]},diagnostics:[]})};
  const extended = new Engine(frontend, new Registry([extra]), {test_profile:{module:['test.fact']}});
  const result = extended.parse({...request('module'),profile:'test_profile'},'中',limits);
  assert.deepEqual(result.facts['test.fact'],{label:'extension',span:[0,3]});
  assert.ok(!engine.capabilities().some(c=>c.id==='test.fact'));
  const combined = new Engine(frontend, new Registry([...engine.registry.providers.values(),extra]),
    {...engine.manifests,test_profile:{module:['test.fact']}});
  assert.ok(combined.capabilities().some(c=>c.id==='test.fact'));
  const p1 = combined.parse(request('module'),header,limits);
  assert.ok(!('test.fact' in p1.coverage));
  assert.deepEqual(p1,parse(header,'module'));
});
test('E-02 cycles, missing or duplicate providers, unknown profiles and IR fail explicitly', () => {
  const extractor = (id,requires=[])=>({id,requires,version:'1',run(){},validate(){return true;}});
  assert.throws(()=>new Registry([extractor('a'),extractor('a')]),/DUPLICATE_PROVIDER/);
  assert.throws(()=>new Registry([extractor('a',['b']),extractor('b',['a'])]).plan(['a']),/DEPENDENCY_CYCLE/);
  assert.throws(()=>new Registry([]).plan(['missing']),/CAPABILITY_MISSING/);
  assert.throws(()=>engine.parse({...request(),profile:'future'},'',limits),/PROFILE_UNSUPPORTED/);
  assert.throws(()=>engine.parse({...request(),ir_schema_version:'2'},'',limits),/IR_UNSUPPORTED/);
});
test('extractor budget failure propagates without becoming a process failure', () => {
  const result = engine.parse(request(), 'import x from "x"; import y from "y";', {...limits,references:1});
  assert.equal(result.coverage['kit.references'].status, 'failed');
  assert.equal(result.coverage['condition.top_level'].status, 'failed');
  assert.equal(result.coverage['file.header'].status, 'complete');
});
