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

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

'use strict';

function props(x) {
  const array = [];
  for (let p in x) { array.push(p); }
  return array.sort();
}

arktest.assertEQ(0, props({}).length);
arktest.assertEQ(1, props({x:1}).length);
arktest.assertEQ(2, props({x:1, y:2}).length);

arktest.assertEQ(['x'], props({x:1}));
arktest.assertEQ(['x', 'y'], props({x:1, y:2}));
arktest.assertEQ(['x', 'y', 'zoom'], props({x:1, y:2, zoom:3}));

arktest.assertEQ(0, props([]).length);
arktest.assertEQ(1, props([1]).length);
arktest.assertEQ(2, props([1,2]).length);

arktest.assertEQ(['0'], props([1]));
arktest.assertEQ(['0', '1'], props([1,2]));
arktest.assertEQ(['0', '1', '2'], props([1,2,3]));

const o = {};
let a = [];
let i = 'outer_i';
let s = 'outer_s';
for (let i = 0x0020; i < 0x01ff; i+=2) {
  let s = 'char:' + String.fromCharCode(i);
  a.push(s);
  o[s] = i;
}
arktest.assertEQ(a, props(o));
arktest.assertEQ(i, 'outer_i');
arktest.assertEQ(s, 'outer_s');

let a = [];
arktest.assertEQ(0, props(a).length);
a[Math.pow(2,30)-1] = 0;
arktest.assertEQ(1, props(a).length);
a[Math.pow(2,31)-1] = 0;
arktest.assertEQ(2, props(a).length);
a[1] = 0;
arktest.assertEQ(3, props(a).length);

let result = '';
for (let p in {a : [0], b : 1}) { result += p; }
arktest.assertEQ('ab', result);

let result = '';
for (let p in {a : {v:1}, b : 1}) { result += p; }
arktest.assertEQ('ab', result);

let result = '';
for (let p in { get a() {}, b : 1}) { result += p; }
arktest.assertEQ('ab', result);

let result = '';
for (let p in { get a() {}, set a(x) {}, b : 1}) { result += p; }
arktest.assertEQ('ab', result);


// Check that there is exactly one variable without initializer
// in a for-in statement with let variables.
arktest.expectThrow('function foo() { \'use strict\'; for (let in {}) { } }', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('function foo() { \'use strict\'; for (let x = 3 in {}) { } }', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('function foo() { \'use strict\'; for (let x, y in {}) { } }', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('function foo() { \'use strict\'; for (let x = 3, y in {}) { } }', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('function foo() { \'use strict\'; for (let x, y = 4 in {}) { } }', ((e: Error): boolean => e instanceof SyntaxError));
arktest.expectThrow('function foo() { \'use strict\'; for (let x = 3, y = 4 in {}) { } }', ((e: Error): boolean => e instanceof SyntaxError));


// In a normal for statement the iteration variable is
// freshly allocated for each iteration.
function closures1() {
  let a = [];
  for (let i = 0; i < 5; ++i) {
    a.push(function () { return i; });
  }
  for (let j = 0; j < 5; ++j) {
    arktest.assertEQ(j, a[j]());
  }
}
closures1();


function closures2() {
  let a = [];
  let b = [];
  for (let i = 0, j = 10; i < 5; ++i, ++j) {
    a.push(function () { return i; });
    b.push(function () { return j; });
  }
  for (let k = 0; k < 5; ++k) {
    arktest.assertEQ(k, a[k]());
    arktest.assertEQ(k + 10, b[k]());
  }
}
closures2();


function closureInForInit() {
  let a = [];
  for (let i = 0, f = function() { return i }; i < 5; ++i) {
    a.push(f);
  }
  for (let k = 0; k < 5; ++k) {
    arktest.assertEQ(0, a[k]());
  }
}
closureInForInit();


function closureInForCond() {
  let a = [];
  for (let i = 0; a.push(function () { return i; }), i < 5; ++i) { }
  for (let k = 0; k < 5; ++k) {
    arktest.assertEQ(k, a[k]());
  }
}
closureInForCond();


function closureInForNext() {
  let a = [];
  for (let i = 0; i < 5; a.push(function () { return i; }), ++i) { }
  for (let k = 0; k < 5; ++k) {
    arktest.assertEQ(k + 1, a[k]());
  }
}
closureInForNext();


// In a for-in statement the iteration variable is fresh
// for each iteration.
function closures3(x) {
  let a = [];
  for (let p in x) {
    a.push(function () { return p; });
  }
  let k = 0;
  for (let q in x) {
    arktest.assertEQ(q, a[k]());
    ++k;
  }
}
closures3({a : [0], b : 1, c : {v : 1}, get d() {}, set e(x) {}});

// Check normal for statement completion values.
arktest.assertEQ(1, eval('for (let i = 0; i < 10; i++) { 1; }'));
arktest.assertEQ(9, eval('for (let i = 0; i < 10; i++) { i; }'));
arktest.assertEQ(undefined, eval('for (let i = 0; false;) { }'));
arktest.assertEQ(undefined, eval('for (const i = 0; false;) { }'));
arktest.assertEQ(undefined, eval('for (let i = 0; i < 10; i++) { }'));
arktest.assertEQ(undefined, eval('for (let i = 0; false;) { i; }'));
arktest.assertEQ(undefined, eval('for (const i = 0; false;) { i; }'));
arktest.assertEQ(undefined, eval('for (let i = 0; true;) { break; }'));
arktest.assertEQ(undefined, eval('for (const i = 0; true;) { break; }'));
arktest.assertEQ(undefined, eval('for (let i = 0; i < 10; i++) { continue; }'));
arktest.assertEQ(undefined, eval('for (let i = 0; true;) { break; i; }'));
arktest.assertEQ(undefined, eval('for (const i = 0; true;) { break; i; }'));
arktest.assertEQ(undefined, eval('for (let i = 0; i < 10; i++) { continue; i; }'));
arktest.assertEQ(0, eval('for (let i = 0; true;) { i; break; }'));
arktest.assertEQ(0, eval('for (const i = 0; true;) { i; break; }'));
arktest.assertEQ(9, eval('for (let i = 0; i < 10; i++) { i; continue; }'));
arktest.assertEQ(undefined,
  eval('for (let i = 0; true; i++) { i; if (i >= 3) break; }'));
arktest.assertEQ(3,
  eval('for (let i = 0; true; i++) { i; if (i >= 3) { i; break; } }'));
arktest.assertEQ(undefined,
  eval('for (let i = 0; true; i++) { if (i >= 3) break; i; }'));
arktest.assertEQ(3,
  eval('for (let i = 0; true; i++) { if (i >= 3) { i; break; }; i; }'));
arktest.assertEQ(undefined,
  eval('for (let i = 0; i < 10; i++) { if (i >= 3) continue; i; }'));
arktest.assertEQ(9,
  eval('for (let i = 0; i < 10; i++) { if (i >= 3) {i; continue; }; i; }'));
arktest.assertEQ(undefined, eval('foo: for (let i = 0; true;) { break foo; }'));
arktest.assertEQ(undefined, eval('foo: for (const i = 0; true;) { break foo; }'));
arktest.assertEQ(3, eval('foo: for (let i = 3; true;) { i; break foo; }'));
