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
expected_out_1: "Semantic error ESE0143: Unresolved reference eval"
---*/

let source: string = 'var value = 1'; let value = eval(source);


(function TestDefaults() {
  function f1(x = 1) { return x }
  arktest.assertEQ(1, f1());
  arktest.assertEQ(1, f1(undefined));
  arktest.assertEQ(2, f1(2));
  arktest.assertEQ(null, f1(null));

  function f2(x, y = x) { return x + y; }
  arktest.assertEQ(8, f2(4));
  arktest.assertEQ(8, f2(4, undefined));
  arktest.assertEQ(6, f2(4, 2));

  function f3(x = 1, y) { return x + y; }
  arktest.assertEQ(8, f3(5, 3));
  arktest.assertEQ(3, f3(undefined, 2));
  arktest.assertEQ(6, f3(4, 2));

  function f4(x = () => 1) { return x() }
  arktest.assertEQ(1, f4());
  arktest.assertEQ(1, f4(undefined));
  arktest.assertEQ(2, f4(() => 2));
  arktest.expectThrow(() => f4(null), ((e: Error): boolean => e instanceof TypeError));

  function f5(x, y = () => x) { return x + y(); }
  arktest.assertEQ(8, f5(4));
  arktest.assertEQ(8, f5(4, undefined));
  arktest.assertEQ(6, f5(4, () => 2));

  function f6(x = {a: 1, m() { return 2 }}) { return x.a + x.m(); }
  arktest.assertEQ(3, f6());
  arktest.assertEQ(3, f6(undefined));
  arktest.assertEQ(5, f6({a: 2, m() { return 3 }}));

  let g1 = (x = 1) => { return x };
  arktest.assertEQ(1, g1());
  arktest.assertEQ(1, g1(undefined));
  arktest.assertEQ(2, g1(2));
  arktest.assertEQ(null, g1(null));

  let g2 = (x, y = x) => { return x + y; };
  arktest.assertEQ(8, g2(4));
  arktest.assertEQ(8, g2(4, undefined));
  arktest.assertEQ(6, g2(4, 2));

  let g3 = (x = 1, y) => { return x + y; };
  arktest.assertEQ(8, g3(5, 3));
  arktest.assertEQ(3, g3(undefined, 2));
  arktest.assertEQ(6, g3(4, 2));

  let g4 = (x = () => 1) => { return x() };
  arktest.assertEQ(1, g4());
  arktest.assertEQ(1, g4(undefined));
  arktest.assertEQ(2, g4(() => 2));
  arktest.expectThrow(() => g4(null), ((e: Error): boolean => e instanceof TypeError));

  let g5 = (x, y = () => x) => { return x + y(); };
  arktest.assertEQ(8, g5(4));
  arktest.assertEQ(8, g5(4, undefined));
  arktest.assertEQ(6, g5(4, () => 2));

  let g6 = (x = {a: 1, m() { return 2 }}) => { return x.a + x.m(); };
  arktest.assertEQ(3, g6());
  arktest.assertEQ(3, g6(undefined));
  arktest.assertEQ(5, g6({a: 2, m() { return 3 }}));
}());


(function TestEvalInParameters() {
  function f1(x = eval(0)) { return x }
  arktest.assertEQ(0, f1());
  function f2(x = () => eval(1)) { return x() }
  arktest.assertEQ(1, f2());
})();


(function TestParameterScopingSloppy() {
  let x = 1;

  function f1(a = x) { let x = 2; return a; }
  arktest.assertEQ(1, f1());
  function f2(a = x) { function x() {}; return a; }
  arktest.assertEQ(1, f2());
  function f3(a = eval('x')) { let x; return a; }
  arktest.assertEQ(1, f3());
  function f31(a = eval('\'use strict\'; x')) { let x; return a; }
  arktest.assertEQ(1, f31());
  function f4(a = function() { return x }) { let x; return a(); }
  arktest.assertEQ(1, f4());
  function f5(a = () => x) { let x; return a(); }
  arktest.assertEQ(1, f5());
  function f6(a = () => eval('x')) { let x; return a(); }
  arktest.assertEQ(1, f6());
  function f61(a = () => { 'use strict'; return eval('x') }) { let x; return a(); }
  arktest.assertEQ(1, f61());
  function f62(a = () => eval('\'use strict\'; x')) { let x; return a(); }
  arktest.assertEQ(1, f62());

  let g1 = (a = x) => { let x = 2; return a; };
  arktest.assertEQ(1, g1());
  let g2 = (a = x) => { function x() {}; return a; };
  arktest.assertEQ(1, g2());
  let g3 = (a = eval('x')) => { let x; return a; };
  arktest.assertEQ(1, g3());
  const g31 = (a = eval('\'use strict\'; x')) => { let x; return a; };
  arktest.assertEQ(1, g31());
  let g4 = (a = function() { return x }) => { let x; return a(); };
  arktest.assertEQ(1, g4());
  let g5 = (a = () => x) => { let x; return a(); };
  arktest.assertEQ(1, g5());
  let g6 = (a = () => eval('x')) => { let x; return a(); };
  arktest.assertEQ(1, g6());
  const g61 = (a = () => { 'use strict'; return eval('x') }) => { let x; return a(); };
  arktest.assertEQ(1, g61());
  const g62 = (a = () => eval('\'use strict\'; x')) => { let x; return a(); };
  arktest.assertEQ(1, g62());

  let f11 = function f(x = f) { let f; return x; }
  arktest.assertEQ(f11, f11());
  let f12 = function f(x = f) { function f() {}; return x; }
  arktest.assertEQ(f12, f12());
  let f13 = function f(f = 7, x = f) { return x; }
  arktest.assertEQ(7, f13());

  const o1 = {f: function(x = this) { return x; }};
  arktest.assertEQ(o1, o1.f());
  arktest.assertEQ(1, o1.f(1));
})();

(function TestParameterScopingStrict() {
  'use strict';
  let x = 1;

  function f1(a = x) { let x = 2; return a; }
  arktest.assertEQ(1, f1());
  function f2(a = x) { const x = 2; return a; }
  arktest.assertEQ(1, f2());
  function f3(a = x) { function x() {}; return a; }
  arktest.assertEQ(1, f3());
  function f4(a = eval('x')) { let x; return a; }
  arktest.assertEQ(1, f4());
  function f5(a = () => eval('x')) { let x; return a(); }
  arktest.assertEQ(1, f5());

  let g1 = (a = x) => { let x = 2; return a; };
  arktest.assertEQ(1, g1());
  let g2 = (a = x) => { const x = 2; return a; };
  arktest.assertEQ(1, g2());
  let g3 = (a = x) => { function x() {}; return a; };
  arktest.assertEQ(1, g3());
  let g4 = (a = eval('x')) => { let x; return a; };
  arktest.assertEQ(1, g4());
  let g5 = (a = () => eval('x')) => { let x; return a(); };
  arktest.assertEQ(1, g5());

  let f11 = function f(x = f) { let f; return x; }
  arktest.assertEQ(f11, f11());
  let f12 = function f(x = f) { const f = 0; return x; }
  arktest.assertEQ(f12, f12());
  let f13 = function f(x = f) { function f() {}; return x; }
  arktest.assertEQ(f13, f13());
})();

(function TestSloppyEvalScoping() {
  let x = 1;

  function f1(y = eval('var x = 2')) { with ({}) { return x; } }
  arktest.assertEQ(2, f1());
  function f2(y = eval('var x = 2'), z = x) { return z; }
  arktest.assertEQ(2, f2());
  arktest.assertEQ(1, f2(0));
  function f3(y = eval('var x = 2'), z = eval('x')) { return z; }
  arktest.assertEQ(2, f3());
  arktest.assertEQ(1, f3(0));
  function f8(y = (eval('var x = 2'), x)) { return y; }
  arktest.assertEQ(2, f8());
  arktest.assertEQ(0, f8(0));

  function f11(z = eval('var y = 2')) { return y; }
  arktest.assertEQ(2, f11());
  function f12(z = eval('var y = 2'), b = y) { return b; }
  arktest.assertEQ(2, f12());
  function f13(z = eval('var y = 2'), b = eval('y')) { return b; }
  arktest.assertEQ(2, f13());

  function f21(f = () => x) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f21());
  arktest.assertEQ(3, f21(() => 3));
  function f22(f = () => eval('x')) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f22());
  arktest.assertEQ(3, f22(() => 3));

  let g1 = (y = eval('var x = 2')) => { with ({}) { return x; } };
  arktest.assertEQ(2, g1());
  let g2 = (y = eval('var x = 2'), z = x) => { return z; };
  arktest.assertEQ(2, g2());
  arktest.assertEQ(1, g2(0));
  let g3 = (y = eval('var x = 2'), z = eval('x')) => { return z; };
  arktest.assertEQ(2, g3());
  arktest.assertEQ(1, g3(0));
  const g8 = (y = (eval('var x = 2'), x)) => { return y; };
  arktest.assertEQ(2, g8());
  arktest.assertEQ(0, g8(0));

  const g11 = (z = eval('var y = 2')) => { return y; };
  arktest.assertEQ(2, g11());
  const g12 = (z = eval('var y = 2'), b = y) => { return b; };
  arktest.assertEQ(2, g12());
  const g13 = (z = eval('var y = 2'), b = eval('y')) => { return b; };
  arktest.assertEQ(2, g13());

  const g21 = (f = () => x) => { eval('var x = 2'); return f() };
  arktest.assertEQ(1, g21());
  arktest.assertEQ(3, g21(() => 3));
  const g22 = (f = () => eval('x')) => { eval('var x = 2'); return f() };
  arktest.assertEQ(1, g22());
  arktest.assertEQ(3, g22(() => 3));
})();


(function TestStrictEvalScoping() {
  'use strict';
  let x = 1;

  function f1(y = eval('var x = 2')) { return x; }
  arktest.assertEQ(1, f1());
  function f2(y = eval('var x = 2'), z = x) { return z; }
  arktest.assertEQ(1, f2());
  arktest.assertEQ(1, f2(0));
  function f3(y = eval('var x = 2'), z = eval('x')) { return z; }
  arktest.assertEQ(1, f3());
  arktest.assertEQ(1, f3(0));
  function f8(y = (eval('var x = 2'), x)) { return y; }
  arktest.assertEQ(1, f8());
  arktest.assertEQ(0, f8(0));

  function f11(z = eval('var y = 2')) { return y; }
  arktest.expectThrow(f11, ((e: Error): boolean => e instanceof ReferenceError));
  function f12(z = eval('var y = 2'), b = y) {}
  arktest.expectThrow(f12, ((e: Error): boolean => e instanceof ReferenceError));
  function f13(z = eval('var y = 2'), b = eval('y')) {}
  arktest.expectThrow(f13, ((e: Error): boolean => e instanceof ReferenceError));

  function f21(f = () => x) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f21());
  arktest.assertEQ(3, f21(() => 3));
  function f22(f = () => eval('x')) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f22());
  arktest.assertEQ(3, f22(() => 3));
})();

(function TestParameterTDZSloppy() {
  function f1(a = x, x) { return a }
  arktest.expectThrow(() => f1(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f1(4, 5));
  function f2(a = eval('x'), x) { return a }
  arktest.expectThrow(() => f2(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f2(4, 5));
  function f3(a = eval('\'use strict\'; x'), x) { return a }
  arktest.expectThrow(() => f3(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f3(4, 5));
  function f4(a = () => x, x) { return a() }
  arktest.assertEQ(4, f4(() => 4, 5));
  function f5(a = () => eval('x'), x) { return a() }
  arktest.assertEQ(4, f5(() => 4, 5));
  function f6(a = () => eval('\'use strict\'; x'), x) { return a() }
  arktest.assertEQ(4, f6(() => 4, 5));

  function f11(a = x, x = 2) { return a }
  arktest.expectThrow(() => f11(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f1(4, 5));
  function f12(a = eval('x'), x = 2) { return a }
  arktest.expectThrow(() => f12(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f12(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f12(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f12(4, 5));
  function f13(a = eval('\'use strict\'; x'), x = 2) { return a }
  arktest.expectThrow(() => f13(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f13(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f13(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f13(4, 5));

  function f21(x = function() { return a }, ...a) { return x()[0] }
  arktest.assertEQ(4, f21(undefined, 4));
  function f22(x = () => a, ...a) { return x()[0] }
  arktest.assertEQ(4, f22(undefined, 4));
  function f23(x = () => eval('a'), ...a) { return x()[0] }
  arktest.assertEQ(4, f23(undefined, 4));
  function f24(x = () => {'use strict'; return eval('a') }, ...a) {
    return x()[0]
  }
  arktest.assertEQ(4, f24(undefined, 4));
  function f25(x = () => eval('\'use strict\'; a'), ...a) { return x()[0] }
  arktest.assertEQ(4, f25(undefined, 4));

  let g1 = (x = function() { return a }, ...a) => { return x()[0] };
  arktest.assertEQ(4, g1(undefined, 4));
  let g2 = (x = () => a, ...a) => { return x()[0] };
  arktest.assertEQ(4, g2(undefined, 4));
})();

(function TestParameterTDZStrict() {
  'use strict';

  function f1(a = eval('x'), x) { return a }
  arktest.expectThrow(() => f1(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f1(4, 5));
  function f2(a = () => eval('x'), x) { return a() }
  arktest.assertEQ(4, f2(() => 4, 5));

  function f11(a = eval('x'), x = 2) { return a }
  arktest.expectThrow(() => f11(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f11(4, 5));

  function f21(x = () => eval('a'), ...a) { return x()[0] }
  arktest.assertEQ(4, f21(undefined, 4));
})();

(function TestArgumentsForNonSimpleParameters() {
  function f1(x = 900) { arguments[0] = 1; return x }
  arktest.assertEQ(9, f1(9));
  arktest.assertEQ(900, f1());
  function f2(x = 1001) { x = 2; return arguments[0] }
  arktest.assertEQ(10, f2(10));
  arktest.assertEQ(undefined, f2());
}());


(function TestFunctionLength() {
   arktest.assertEQ(0, (function(x = 1) {}).length);
   arktest.assertEQ(0, (function(x = 1, ...a) {}).length);
   arktest.assertEQ(1, (function(x, y = 1) {}).length);
   arktest.assertEQ(1, (function(x, y = 1, ...a) {}).length);
   arktest.assertEQ(2, (function(x, y, z = 1) {}).length);
   arktest.assertEQ(2, (function(x, y, z = 1, ...a) {}).length);
   arktest.assertEQ(1, (function(x, y = 1, z) {}).length);
   arktest.assertEQ(1, (function(x, y = 1, z, ...a) {}).length);
   arktest.assertEQ(1, (function(x, y = 1, z, v = 2) {}).length);
   arktest.assertEQ(1, (function(x, y = 1, z, v = 2, ...a) {}).length);
})();

(function TestDirectiveThrows() {
  'use strict';

  arktest.expectThrow('(function(x=1){\'use strict\';})', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(x=1) => {\'use strict\';}', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(class{foo(x=1) {\'use strict\';}});', ((e: Error): boolean => e instanceof SyntaxError));

  arktest.expectThrow('(function(a, x=1){\'use strict\';})', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(a, x=1) => {\'use strict\';}', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(class{foo(a, x=1) {\'use strict\';}});', ((e: Error): boolean => e instanceof SyntaxError));

  arktest.expectThrow('(function({x}){\'use strict\';})', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('({x}) => {\'use strict\';}', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(class{foo({x}) {\'use strict\';}});', ((e: Error): boolean => e instanceof SyntaxError));
})();
