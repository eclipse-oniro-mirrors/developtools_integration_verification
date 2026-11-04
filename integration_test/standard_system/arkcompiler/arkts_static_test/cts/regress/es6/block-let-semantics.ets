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

'use strict';

// Test temporal dead zone semantics of let bound variables in
// function and block scopes.

function testFunctionLocal(s: string): void {
  try {
    eval('(function(){' + s + '; })')();
  } catch (e) {
    arktest.assertTrue(e instanceof ReferenceError);
    return;
  }
  arktest.assertTrue(false, 'expected a ReferenceError');
}

function testBlockLocal(s: string, e: string = ''): void {
  try {
    eval('(function(){ {' + s + ';} })')();
  } catch (e) {
    arktest.assertTrue(e instanceof ReferenceError);
    return;
  }
  arktest.assertTrue(false, 'expected a ReferenceError');
}


function testAll(s: string): void {
  testBlockLocal(s);
  testFunctionLocal(s);
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
testAll('let y = x; class x {}');

testAll('f(); let x; function f() { return x + 1; }');
testAll('f(); let x; function f() { x = 1; }');
testAll('f(); let x; function f() { x += 1; }');
testAll('f(); let x; function f() { ++x; }');
testAll('f(); let x; function f() { x++; }');
testAll('f(); const x = 1; function f() { return x; }');
testAll('f(); class x { }; function f() { return x; }');

testAll('f()(); let x; function f() { return function() { return x + 1; } }');
testAll('f()(); let x; function f() { return function() { x = 1; } }');
testAll('f()(); let x; function f() { return function() { x += 1; } }');
testAll('f()(); let x; function f() { return function() { ++x; } }');
testAll('f()(); let x; function f() { return function() { x++; } }');
testAll('f()(); const x = 1; function f() { return function() { return x; } }');
testAll('f()(); class x { }; function f() { return function() { return x; } }');

for (let kw of ['let x = 2', 'const x = 2', 'class x { }']) {
  // Use before initialization with a dynamic lookup.
  testAll(`eval("x"); ${kw};`);
  testAll(`eval("x + 1;"); ${kw};`);
  testAll(`eval("x = 1;"); ${kw};`);
  testAll(`eval("x += 1;"); ${kw};`);
  testAll(`eval("++x;"); ${kw};`);
  testAll(`eval("x++;"); ${kw};`);

  // Use before initialization with check for eval-shadowed bindings.
  testAll(`function f() { eval("var y = 2;"); x + 1; }; f(); ${kw};`);
  testAll(`function f() { eval("var y = 2;"); x = 1; }; f(); ${kw};`);
  testAll(`function f() { eval("var y = 2;"); x += 1; }; f(); ${kw};`);
  testAll(`function f() { eval("var y = 2;"); ++x; }; f(); ${kw};`);
  testAll(`function f() { eval("var y = 2;"); x++; }; f(); ${kw};`);
}

// Test that variables introduced by function declarations are created and
// initialized upon entering a function / block scope.
function f() {
  {
    arktest.assertEQ(2, g1());
    arktest.assertEQ(2, eval('g1()'));

    // block scoped function declaration
    function g1() {
      return 2;
    }
  }

  arktest.assertEQ(3, g2());
  arktest.assertEQ(3, eval('g2()'));
  // function scoped function declaration
  function g2() {
    return 3;
  }
}
f();

// Test that a function declaration introduces a block scoped variable.
testAll('{ function k() { return 0; } }; k(); ');

// Test that a function declaration sees the scope it resides in.
function f2() {
  let m;
  let n;
  let o;
  let p;
  {
    m = g;
    function g() {
      return a;
    }
    let a = 1;
  }
  arktest.assertEQ(1, m());

  try {
    throw 2;
  } catch(b) {
    n = h;
    function h() {
      return b + c;
    }
    let c = 3;
  }
  arktest.assertEQ(5, n());

  {
    o = i;
    function i() {
      return d;
    }
    let d = 4;
  }
  arktest.assertEQ(4, o());

  try {
    throw 5;
  } catch(e) {
    p = j;
    function j() {
      return e + f;
    }
    let f = 6;
  }
  arktest.assertEQ(11, p());
}
f2();

// Test that resolution of let bound variables works with scopes that call eval.
function outer() {
  function middle() {
    function inner() {
      return x;
    }
    eval('1 + 1');
    return x + inner();
  }

  let x = 1;
  return middle();
}

arktest.assertEQ(2, outer());
