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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function TestDefaultBeforeInitializingYield() {
  let y = 0;
  let z = 0;
  function* f1(x = (y = 1)) { z = 1 };
  arktest.assertEQ(0, y);
  arktest.assertEQ(0, z);
  const gen = f1();
  arktest.assertEQ(1, y);
  arktest.assertEQ(0, z);
  gen.next();
  arktest.assertEQ(1, y);
  arktest.assertEQ(1, z);
})();

(function TestShadowingOfParameters() {
  function* f1({x}) { let x = 2; return x }
  arktest.assertEQ(2, f1({x: 1}).next().value);
  function* f2({x}) { { let x = 2; } return x; }
  arktest.assertEQ(2, f2({x: 1}).next().value);
  function* f3({x}) { let y = x; let x = 2; return y; }
  arktest.assertEQ(1, f3({x: 1}).next().value);
  function* f4({x}) { { let y = x; let x = 2; } return y; }
  arktest.assertEQ(1, f4({x: 1}).next().value);
  function* f5({x}, g = () => x) { let x = 2; return g(); }
  arktest.assertEQ(1, f5({x: 1}).next().value);
  function* f6({x}, g = () => x) { { let x = 2; } return g(); }
  arktest.assertEQ(1, f6({x: 1}).next().value);
  function* f7({x}) { let g = () => x; let x = 2; return g(); }
  arktest.assertEQ(2, f7({x: 1}).next().value);
  function* f8({x}) { { let g = () => x; let x = 2; } return g(); }
  arktest.assertEQ(2, f8({x: 1}).next().value);
  function* f9({x}, g = () => eval('x')) { let x = 2; return g(); }
  arktest.assertEQ(1, f9({x: 1}).next().value);

  function* f10({x}, y) { let y; return y }
  arktest.assertEQ(2, f10({x: 6}, 2).next().value);
  function* f11({x}, y) { let z = y; let y = 2; return z; }
  arktest.assertEQ(1, f11({x: 6}, 1).next().value);
  function* f12(y, g = () => y) { let y = 2; return g(); }
  arktest.assertEQ(1, f12(1).next().value);
  function* f13({x}, y, [z], v) {
    let x;
    let y;
    let z;
    return x*y*z*v;
  }
  arktest.assertEQ(210, f13({x: 2}, 3, [5], 7).next().value);

  function* f20({x}) { function x() { return 2 }; return x(); }
  arktest.assertEQ(2, f20({x: 1}).next().value);
  // Annex B 3.3 function hoisting is blocked by the conflicting x declaration
  function* f21({x}) { { function x() { return 2 } } return x; }
  arktest.assertEQ(1, f21({x: 1}).next().value);

  // These errors are not recognized in lazy parsing; see mjsunit/bugs/bug-2728.js
  arktest.expectThrow('\'use strict\'; (function* f(x) { let x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; (function* f({x}) { let x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; (function* f(x) { const x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('\'use strict\'; (function* f({x}) { const x = 0; })()', ((e: Error): boolean => e instanceof SyntaxError));
}());

(function TestDefaults() {
  function* f1(x = 1) { return x }
  arktest.assertEQ(1, f1().next().value);
  arktest.assertEQ(1, f1(undefined).next().value);
  arktest.assertEQ(2, f1(2).next().value);
  arktest.assertEQ(null, f1(null).next().value);

  function* f2(x, y = x) { return x + y; }
  arktest.assertEQ(8, f2(4).next().value);
  arktest.assertEQ(8, f2(4, undefined).next().value);
  arktest.assertEQ(6, f2(4, 2).next().value);

  function* f3(x = 1, y) { return x + y; }
  arktest.assertEQ(8, f3(5, 3).next().value);
  arktest.assertEQ(3, f3(undefined, 2).next().value);
  arktest.assertEQ(6, f3(4, 2).next().value);

  function* f4(x = () => 1) { return x() }
  arktest.assertEQ(1, f4().next().value);
  arktest.assertEQ(1, f4(undefined).next().value);
  arktest.assertEQ(2, f4(() => 2).next().value);
  arktest.expectThrow(() => f4(null).next(), ((e: Error): boolean => e instanceof TypeError));

  function* f5(x, y = () => x) { return x + y(); }
  arktest.assertEQ(8, f5(4).next().value);
  arktest.assertEQ(8, f5(4, undefined).next().value);
  arktest.assertEQ(6, f5(4, () => 2).next().value);

  function* f6(x = {a: 1, m() { return 2 }}) { return x.a + x.m(); }
  arktest.assertEQ(3, f6().next().value);
  arktest.assertEQ(3, f6(undefined).next().value);
  arktest.assertEQ(5, f6({a: 2, m() { return 3 }}).next().value);
}());


(function TestEvalInParameters() {
  function* f1(x = eval(0)) { return x }
  arktest.assertEQ(0, f1().next().value);
  function* f2(x = () => eval(1)) { return x() }
  arktest.assertEQ(1, f2().next().value);
})();


(function TestParameterScopingSloppy() {
  let x = 1;

  function* f1(a = x) { let x = 2; return a; }
  arktest.assertEQ(1, f1().next().value);
  function* f2(a = x) { function x() {}; return a; }
  arktest.assertEQ(1, f2().next().value);
  function* f3(a = eval('x')) { let x; return a; }
  arktest.assertEQ(1, f3().next().value);
  function* f31(a = eval('\'use strict\'; x')) { let x; return a; }
  arktest.assertEQ(1, f31().next().value);
  function* f4(a = function() { return x }) { let x; return a(); }
  arktest.assertEQ(1, f4().next().value);
  function* f5(a = () => x) { let x; return a(); }
  arktest.assertEQ(1, f5().next().value);
  function* f6(a = () => eval('x')) { let x; return a(); }
  arktest.assertEQ(1, f6().next().value);
  function* f61(a = () => { 'use strict'; return eval('x') }) { let x; return a(); }
  arktest.assertEQ(1, f61().next().value);
  function* f62(a = () => eval('\'use strict\'; x')) { let x; return a(); }
  arktest.assertEQ(1, f62().next().value);

  let f11 = function* f(x = f) { let f; return x; }
  arktest.assertEQ(f11, f11().next().value);
  let f12 = function* f(x = f) { function f() {}; return x; }
  arktest.assertEQ(f12, f12().next().value);
  let f13 = function* f(f = 7, x = f) { return x; }
  arktest.assertEQ(7, f13().next().value);

  const o1 = {f: function*(x = this) { return x; }};
  arktest.assertEQ(o1, o1.f().next().value);
  arktest.assertEQ(1, o1.f(1).next().value);
})();

(function TestParameterScopingStrict() {
  'use strict';
  let x = 1;

  function* f1(a = x) { let x = 2; return a; }
  arktest.assertEQ(1, f1().next().value);
  function* f2(a = x) { const x = 2; return a; }
  arktest.assertEQ(1, f2().next().value);
  function* f3(a = x) { function x() {}; return a; }
  arktest.assertEQ(1, f3().next().value);
  function* f4(a = eval('x')) { let x; return a; }
  arktest.assertEQ(1, f4().next().value);
  function* f5(a = () => eval('x')) { let x; return a(); }
  arktest.assertEQ(1, f5().next().value);

  let f11 = function* f(x = f) { let f; return x; }
  arktest.assertEQ(f11, f11().next().value);
  let f12 = function* f(x = f) { const f = 0; return x; }
  arktest.assertEQ(f12, f12().next().value);
  let f13 = function* f(x = f) { function f() {}; return x; }
  arktest.assertEQ(f13, f13().next().value);
})();

(function TestSloppyEvalScoping() {
  let x = 1;

  function* f1(y = eval('var x = 2')) { with ({}) { return x; } }
  arktest.assertEQ(2, f1().next().value);
  function* f2(y = eval('var x = 2'), z = x) { return z; }
  arktest.assertEQ(2, f2().next().value);
  arktest.assertEQ(1, f2(0).next().value);
  function* f3(y = eval('var x = 2'), z = eval('x')) { return z; }
  arktest.assertEQ(2, f3().next().value);
  arktest.assertEQ(1, f3(0).next().value);
  function* f8(y = (eval('var x = 2'), x)) { return y; }
  arktest.assertEQ(2, f8().next().value);
  arktest.assertEQ(0, f8(0).next().value);

  function* f11(z = eval('var y = 2')) { return y; }
  arktest.assertEQ(2, f11().next().value);
  function* f12(z = eval('var y = 2'), b = y) { return b; }
  arktest.assertEQ(2, f12().next().value);
  function* f13(z = eval('var y = 2'), b = eval('y')) { return b; }
  arktest.assertEQ(2, f13().next().value);

  function* f21(f = () => x) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f21().next().value);
  arktest.assertEQ(3, f21(() => 3).next().value);
  function* f22(f = () => eval('x')) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f22().next().value);
  arktest.assertEQ(3, f22(() => 3).next().value);
})();


(function TestStrictEvalScoping() {
  'use strict';
  let x = 1;

  function* f1(y = eval('var x = 2')) { return x; }
  arktest.assertEQ(1, f1().next().value);
  function* f2(y = eval('var x = 2'), z = x) { return z; }
  arktest.assertEQ(1, f2().next().value);
  arktest.assertEQ(1, f2(0).next().value);
  function* f3(y = eval('var x = 2'), z = eval('x')) { return z; }
  arktest.assertEQ(1, f3().next().value);
  arktest.assertEQ(1, f3(0).next().value);
  function* f8(y = (eval('var x = 2'), x)) { return y; }
  arktest.assertEQ(1, f8().next().value);
  arktest.assertEQ(0, f8(0).next().value);

  function* f11(z = eval('var y = 2')) { return y; }
  arktest.expectThrow(() => f11().next().value, ((e: Error): boolean => e instanceof ReferenceError));
  function* f12(z = eval('var y = 2'), b = y) {}
  arktest.expectThrow(() => f12().next().value, ((e: Error): boolean => e instanceof ReferenceError));
  function* f13(z = eval('var y = 2'), b = eval('y')) {}
  arktest.expectThrow(() => f13().next().value, ((e: Error): boolean => e instanceof ReferenceError));

  function* f21(f = () => x) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f21().next().value);
  arktest.assertEQ(3, f21(() => 3).next().value);
  function* f22(f = () => eval('x')) { eval('var x = 2'); return f() }
  arktest.assertEQ(1, f22().next().value);
  arktest.assertEQ(3, f22(() => 3).next().value);
})();

(function TestParameterTDZSloppy() {
  function* f1(a = x, x) { return a }
  arktest.expectThrow(() => f1(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f1(4, 5).next().value);
  function* f2(a = eval('x'), x) { return a }
  arktest.expectThrow(() => f2(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f2(4, 5).next().value);
  function* f3(a = eval('\'use strict\'; x'), x) { return a }
  arktest.expectThrow(() => f3(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f3(4, 5).next().value);
  function* f4(a = () => x, x) { return a() }
  arktest.assertEQ(4, f4(() => 4, 5).next().value);
  function* f5(a = () => eval('x'), x) { return a() }
  arktest.assertEQ(4, f5(() => 4, 5).next().value);
  function* f6(a = () => eval('\'use strict\'; x'), x) { return a() }
  arktest.assertEQ(4, f6(() => 4, 5).next().value);

  function* f11(a = x, x = 2) { return a }
  arktest.expectThrow(() => f11(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f1(4, 5).next().value);
  function* f12(a = eval('x'), x = 2) { return a }
  arktest.expectThrow(() => f12(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f12(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f12(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f12(4, 5).next().value);
  function* f13(a = eval('\'use strict\'; x'), x = 2) { return a }
  arktest.expectThrow(() => f13(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f13(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f13(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f13(4, 5).next().value);

  function* f21(x = function() { return a }, ...a) { return x()[0] }
  arktest.assertEQ(4, f21(undefined, 4).next().value);
  function* f22(x = () => a, ...a) { return x()[0] }
  arktest.assertEQ(4, f22(undefined, 4).next().value);
  function* f23(x = () => eval('a'), ...a) { return x()[0] }
  arktest.assertEQ(4, f23(undefined, 4).next().value);
  function* f24(x = () => {'use strict'; return eval('a') }, ...a) {
    return x()[0]
  }
  arktest.assertEQ(4, f24(undefined, 4).next().value);
  function* f25(x = () => eval('\'use strict\'; a'), ...a) { return x()[0] }
  arktest.assertEQ(4, f25(undefined, 4).next().value);
})();

(function TestParameterTDZStrict() {
  'use strict';

  function* f1(a = eval('x'), x) { return a }
  arktest.expectThrow(() => f1(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f1(4, 5).next().value);
  function* f2(a = () => eval('x'), x) { return a() }
  arktest.assertEQ(4, f2(() => 4, 5).next().value);

  function* f11(a = eval('x'), x = 2) { return a }
  arktest.expectThrow(() => f11(), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.expectThrow(() => f11(undefined, 4), ((e: Error): boolean => e instanceof ReferenceError));
  arktest.assertEQ(4, f11(4, 5).next().value);

  function* f21(x = () => eval('a'), ...a) { return x()[0] }
  arktest.assertEQ(4, f21(undefined, 4).next().value);
})();

(function TestArgumentsForNonSimpleParameters() {
  function* f1(x = 900) { arguments[0] = 1; return x }
  arktest.assertEQ(9, f1(9).next().value);
  arktest.assertEQ(900, f1().next().value);
  function* f2(x = 1001) { x = 2; return arguments[0] }
  arktest.assertEQ(10, f2(10).next().value);
  arktest.assertEQ(undefined, f2().next().value);
}());


(function TestFunctionLength() {
   arktest.assertEQ(0, (function*(x = 1) {}).length);
   arktest.assertEQ(0, (function*(x = 1, ...a) {}).length);
   arktest.assertEQ(1, (function*(x, y = 1) {}).length);
   arktest.assertEQ(1, (function*(x, y = 1, ...a) {}).length);
   arktest.assertEQ(2, (function*(x, y, z = 1) {}).length);
   arktest.assertEQ(2, (function*(x, y, z = 1, ...a) {}).length);
   arktest.assertEQ(1, (function*(x, y = 1, z) {}).length);
   arktest.assertEQ(1, (function*(x, y = 1, z, ...a) {}).length);
   arktest.assertEQ(1, (function*(x, y = 1, z, v = 2) {}).length);
   arktest.assertEQ(1, (function*(x, y = 1, z, v = 2, ...a) {}).length);
})();

(function TestDirectiveThrows() {
  'use strict';

  arktest.expectThrow('(function*(x=1){\'use strict\';})', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(function*(a, x=1){\'use strict\';})', ((e: Error): boolean => e instanceof SyntaxError));
  arktest.expectThrow('(function*({x}){\'use strict\';})', ((e: Error): boolean => e instanceof SyntaxError));
})();
