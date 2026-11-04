/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Test that we throw early syntax errors in harmony mode
// when using an immutable binding in an assigment or with
// prefix/postfix decrement/increment operators.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

const decls = [
  // Const declaration.
  function(use) { return 'const c = 1; ' + use + ';' }, TypeError,
  function(use) { return 'const x = 0, c = 1; ' + use + ';' }, TypeError,
  function(use) { return 'const c = 1, x = (' + use + ');' }, TypeError,
  function(use) { return use + '; const c = 1;' }, ReferenceError,
  function(use) { return use + '; const x = 0, c = 1;' }, ReferenceError,
  function(use) { return 'const x = (' + use + '), c = 1;' }, ReferenceError,
  function(use) { return 'const c = (' + use + ');' }, ReferenceError,

  // Function expression.
  function(use) { return '(function c() { ' + use + '; })();'; }, TypeError,
  // TODO(rossberg): Once we have default parameters, test using 'c' there.

  // Class expression.
  function(use) {
    return 'new class c { constructor() { ' + use + ' } };';
  }, TypeError,
  function(use) {
    return '(new class c { m() { ' + use + ' } }).m();';
  }, TypeError,
  function(use) {
    return '(new class c { get a() { ' + use + ' } }).a;';
  }, TypeError,
  function(use) {
    return '(new class c { set a(x) { ' + use + ' } }).a = 0;';
  }, TypeError,
  function(use) {
    return '(class c { static m() { ' + use + ' } }).s();';
  }, TypeError,
  function(use) {
    return '(class c extends (' + use + ') {});';
  }, ReferenceError,
  function(use) {
    return '(class c { [' + use + ']() {} });';
  }, ReferenceError,
  function(use) {
    return '(class c { get [' + use + ']() {} });';
  }, ReferenceError,
  function(use) {
    return '(class c { set [' + use + '](x) {} });';
  }, ReferenceError,
  function(use) {
    return '(class c { static [' + use + ']() {} });';
  }, ReferenceError,

  // For loop.
  function(use) {
    return 'for (const c = 0; ' + use + ';) {}'
  }, TypeError,
  function(use) {
    return 'for (const x = 0, c = 0; ' + use + ';) {}'
  }, TypeError,
  function(use) {
    return 'for (const c = 0; ; ' + use + ') {}'
  }, TypeError,
  function(use) {
    return 'for (const x = 0, c = 0; ; ' + use + ') {}'
  }, TypeError,
  function(use) {
    return 'for (const c = 0; ;) { ' + use + '; }'
  }, TypeError,
  function(use) {
    return 'for (const x = 0, c = 0; ;) { ' + use + '; }'
  }, TypeError,
  function(use) {
    return 'for (const c in {a: 1}) { ' + use + '; }'
  }, TypeError,
  function(use) {
    return 'for (const c of [1]) { ' + use + '; }'
  }, TypeError,
  function(use) {
    return 'for (const x = (' + use + '), c = 0; ;) {}'
  }, ReferenceError,
  function(use) {
    return 'for (const c = (' + use + '); ;) {}'
  }, ReferenceError,
]

let uses = [
  'c = 1',
  'c += 1',
  '++c',
  'c--',
];

let declcontexts = [
  function(decl) { return decl; },
  function(decl) { return 'eval(\'' + decl + '\')'; },
  function(decl) { return '{ ' + decl + ' }'; },
  function(decl) { return '(function() { ' + decl + ' })()'; },
];

let usecontexts = [
  function(use) { return use; },
  function(use) { return 'eval("' + use + '")'; },
  function(use) { return '(function() { ' + use + ' })()'; },
  function(use) { return '(function() { eval("' + use + '"); })()'; },
  function(use) { return 'eval("(function() { ' + use + '; })")()'; },
];

function test(program, error) {
  program = '\'use strict\'; ' + program;
  try {
    print(program, '  // throw ' + error.name);
    eval(program);
  } catch (e) {
    arktest.assertTrue(e instanceof error);
    if (e === TypeError) {
      arktest.assertTrue(e.toString().indexOf('Assignment to constant variable') >= 0);
    }
    return;
  }
  arktest.assertTrue(false, 'expected an exception');
}

for (let d = 0; d < decls.length; d += 2) {
  for (let u = 0; u < uses.length; ++u) {
    for (let o = 0; o < declcontexts.length; ++o) {
      for (let i = 0; i < usecontexts.length; ++i) {
        test(declcontexts[o](decls[d](usecontexts[i](uses[u]))), decls[d + 1]);
      }
    }
  }
}
