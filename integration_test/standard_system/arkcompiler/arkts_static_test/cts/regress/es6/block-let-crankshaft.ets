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
expected_out_1: "Semantic error ESE0143: Unresolved reference ArkTools"
---*/

'use strict';

// Check that the following functions are optimizable.
let functions = [ f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14,
                  f15, f16, f17, f18, f19, f20, f21, f22, f23, f24, f25, f26,
                  f27, f28, f29, f30, f31, f32, f33];

for (let i = 0; i < functions.length; ++i) {
  let func = functions[i];
  ArkTools.prepareFunctionForOptimization(func);
  print('Testing:');
  print(func);
  for (let j = 0; j < 10; ++j) {
    func(12);
  }
  ArkTools.optimizeFunctionOnNextCall(func);
  func(12);
  arktest.assertTrue(func);
}

function f1() { }

function f2(x) { }

function f3() {
  let x;
}

function f4() {
  function foo() {
  }
}

function f5() {
  let x = 1;
}

function f6() {
  const x = 1;
}

function f7(x) {
  return x;
}

function f8() {
  let x;
  return x;
}

function f9() {
  function x() {
  }
  return x;
}

function f10(x) {
  x = 1;
}

function f11() {
  let x;
  x = 1;
}

function f12() {
  function x() {};
  x = 1;
}

function f13(x) {
  (function() { x; });
}

function f14() {
  let x;
  (function() { x; });
}

function f15() {
  function x() {
  }
  (function() { x; });
}

function f16() {
  let x = 1;
  (function() { x; });
}

function f17() {
  const x = 1;
  (function() { x; });
}

function f18(x) {
  return x;
  (function() { x; });
}

function f19() {
  let x;
  return x;
  (function() { x; });
}

function f20() {
  function x() {
  }
  return x;
  (function() { x; });
}

function f21(x) {
  x = 1;
  (function() { x; });
}

function f22() {
  let x;
  x = 1;
  (function() { x; });
}

function f23() {
  function x() { }
  x = 1;
  (function() { x; });
}

function f24() {
  let x = 1;
  {
    let x = 2;
    {
      let x = 3;
      arktest.assertEQ(3, x);
    }
    arktest.assertEQ(2, x);
  }
  arktest.assertEQ(1, x);
}

function f25() {
  {
    let x = 2;
    L: {
      let x = 3;
      arktest.assertEQ(3, x);
      break L;
      arktest.assertTrue(false);
    }
    arktest.assertEQ(2, x);
  }
  arktest.assertTrue(true);
}

function f26() {
  {
    let x = 1;
    L: {
      let x = 2;
      {
        let x = 3;
        arktest.assertEQ(3, x);
        break L;
        arktest.assertTrue(false);
      }
      arktest.assertTrue(false);
    }
    arktest.assertEQ(1, x);
  }
}


function f27() {
  do {
    let x = 4;
    arktest.assertEQ(4,x);
    {
      let x = 5;
      arktest.assertEQ(5, x);
      continue;
      arktest.assertTrue(false);
    }
  } while (false);
}

function f28() {
  label: for (let i = 0; i < 10; ++i) {
    let x = 'middle' + i;
    for (let j = 0; j < 10; ++j) {
      let x = 'inner' + j;
      continue label;
    }
  }
}

function f29() {
  // Verify that the context is correctly set in the stack frame after exiting
  // from with.

  let x = 'outer';
  label: {
    let x = 'inner';
    break label;
  }
  f();  // The context could be restored from the stack after the call.
  arktest.assertEQ('outer', x);

  function f() {
    arktest.assertEQ('outer', x);
  };
}

function f30() {
  let x = 'outer';
  for (let i = 0; i < 10; ++i) {
    let x = 'inner';
    continue;
  }
  f();
  arktest.assertEQ('outer', x);

  function f() {
    arktest.assertEQ('outer', x);
  };
}

function f31() {
  {
    let x = 'outer';
    label: for (let i = 0; arktest.assertEQ('outer', x), i < 10; ++i) {
      let x = 'middle' + i;
      {
        let x = 'inner' + j;
        continue label;
      }
    }
    arktest.assertEQ('outer', x);
  }
}

const c = true;

function f32() {
  {
    let x = 'outer';
    L: {
      {
        let x = 'inner';
        if (c) {
          break L;
        }
      }
      foo();
    }
  }

  function foo() {
    return 'bar';
  }
}

function f33() {
  {
    let x = 'outer';
    L: {
      {
        let x = 'inner';
        if (c) {
          break L;
        }
        foo();
      }
    }
  }

  function foo() {
    return 'bar';
  }
}

function testThrow() {
  function f() {
    let x = 'outer';
    {
      let x = 'inner';
      throw x;
    }
  }
  ArkTools.prepareFunctionForOptimization(f);
  for (let i = 0; i < 5; i++) {
    try {
      f();
    } catch (e) {
      arktest.assertEQ('inner', e);
    }
  }
  ArkTools.optimizeFunctionOnNextCall(f);
  try {
    f();
  } catch (e) {
    arktest.assertEQ('inner', e);
  }
  arktest.assertTrue(f);
}

testThrow();

// Test that temporal dead zone semantics for function and block scoped
// let bindings are handled by the optimizing compiler.

function testFunctionLocal(s) {
  'use strict';
  let func = eval('(function baz(){' + s + '; })');
  ArkTools.prepareFunctionForOptimization(func);
  print('Testing:');
  print(func);
  for (let i = 0; i < 5; ++i) {
    try {
      func();
      arktest.assertTrue(false, 'expected a ReferenceError');
    } catch (e) {
      arktest.assertTrue(e instanceof ReferenceError);
    }
  }
  ArkTools.optimizeFunctionOnNextCall(func);
  try {
    func();
    arktest.assertTrue(false, 'expected a ReferenceError');
  } catch (e) {
    arktest.assertTrue(e instanceof ReferenceError);
  }
}

function testFunctionContext(s) {
  'use strict';
  let func = eval('(function baz(){ ' + s + '; (function() { x; }); })');
  ArkTools.prepareFunctionForOptimization(func);
  print('Testing:');
  print(func);
  for (let i = 0; i < 5; ++i) {
    print(i);
    try {
      func();
      arktest.assertTrue(false, 'expected a ReferenceError');
    } catch (e) {
      arktest.assertTrue(e instanceof ReferenceError);
    }
  }
  print('optimize');
  ArkTools.optimizeFunctionOnNextCall(func);
  try {
    print('call');
    func();
    arktest.assertTrue(false, 'expected a ReferenceError');
  } catch (e) {
    print('catch');
    arktest.assertTrue(e instanceof ReferenceError);
  }
}

function testBlockLocal(s) {
  'use strict';
  let func = eval('(function baz(){ { ' + s + '; } })');
  ArkTools.prepareFunctionForOptimization(func);
  print('Testing:');
  print(func);
  for (let i = 0; i < 5; ++i) {
    try {
      func();
      arktest.assertTrue(false, 'expected a ReferenceError');
    } catch (e) {
      arktest.assertTrue(e instanceof ReferenceError);
    }
  }
  ArkTools.optimizeFunctionOnNextCall(func);
  try {
    func();
    arktest.assertTrue(false, 'expected a ReferenceError');
  } catch (e) {
    arktest.assertTrue(e instanceof ReferenceError);
  }
}

function testBlockContext(s) {
  'use strict';
  let func = eval('(function baz(){ { ' + s + '; (function() { x; }); } })');
  ArkTools.prepareFunctionForOptimization(func);
  print('Testing:');
  print(func);
  for (let i = 0; i < 5; ++i) {
    print(i);
    try {
      func();
      arktest.assertTrue(false, 'expected a ReferenceError');
    } catch (e) {
      arktest.assertTrue(e instanceof ReferenceError);
    }
  }
  print('optimize');
  ArkTools.optimizeFunctionOnNextCall(func);
  try {
    print('call');
    func();
    arktest.assertTrue(false, 'expected a ReferenceError');
  } catch (e) {
    print('catch');
    arktest.assertTrue(e instanceof ReferenceError);
  }
}

function testAll(s) {
  testFunctionLocal(s);
  testFunctionContext(s);
  testBlockLocal(s);
  testBlockContext(s);
}

// Use before initialization in declaration statement.
testAll('let x = x + 1');
testAll('let x = x += 1');
testAll('let x = x++');
testAll('let x = ++x');
testAll('const x = x + 1');

// Use before initialization in prior statement.
testAll('x + 1; let x;');
testAll('x = 1; let x;');
testAll('x += 1; let x;');
testAll('++x; let x;');
testAll('x++; let x;');
testAll('let y = x; const x = 1;');


function f(x) {
  let y = x + 42;
  return y;
}

function g(x) {
  {
    let y = x + 42;
    return y;
  }
}

ArkTools.prepareFunctionForOptimization(f);
ArkTools.prepareFunctionForOptimization(g);

for (let i=0; i<10; i++) {
  f(i);
  g(i);
}

ArkTools.optimizeFunctionOnNextCall(f);
ArkTools.optimizeFunctionOnNextCall(g);

f(12);
g(12);

arktest.assertTrue(f);
arktest.assertTrue(g);
