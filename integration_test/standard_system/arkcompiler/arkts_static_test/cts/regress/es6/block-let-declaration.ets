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

// Test let declarations in various settings.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0105: Variable must be initialized or it's type must be declared."
---*/

'use strict';

// Global
let x;
let y = 2;
const z = 4;
class C { static foo() { return 1; } }

// Block local
{
  let y;
  let x = 3;
  const z = 5;
  class C { static foo() { return 2; } }
}

arktest.assertEQ(undefined, x);
arktest.assertEQ(2,y);
arktest.assertEQ(4,z);
arktest.assertEQ(1, C.foo());

if (true) {
  let y;
  arktest.assertEQ(undefined, y);
}

// Invalid declarations are early errors in harmony mode and thus should trigger
// an exception in eval code during parsing, before even compiling or executing
// the code. Thus the generated function is not called here.
function testLocalThrows(str, expect) {
  arktest.expectThrow('(function(arg){ \'use strict\'; ' + str + '})', expect);
}

function testLocalDoesNotThrow(str) {
  arktest.expectNoThrow('(function(arg){ \'use strict\'; ' + str + '})()');
}

// Test let declarations in statement positions.
testLocalThrows('if (true) let x;', SyntaxError);
testLocalThrows('if (true) {} else let x;', SyntaxError);
testLocalThrows('do let x; while (false)', SyntaxError);
testLocalThrows('while (false) let x;', SyntaxError);
testLocalThrows('label: let x;', SyntaxError);
testLocalThrows('for (;false;) let x;', SyntaxError);
testLocalDoesNotThrow('switch (true) { case true: let x; }');
testLocalDoesNotThrow('switch (true) { default: let x; }');

// Test const declarations with initialisers in statement positions.
testLocalThrows('if (true) const x = 1;', SyntaxError);
testLocalThrows('if (true) {} else const x = 1;', SyntaxError);
testLocalThrows('do const x = 1; while (false)', SyntaxError);
testLocalThrows('while (false) const x = 1;', SyntaxError);
testLocalThrows('label: const x = 1;', SyntaxError);
testLocalThrows('for (;false;) const x = 1;', SyntaxError);
testLocalDoesNotThrow('switch (true) { case true: const x = 1; }');
testLocalDoesNotThrow('switch (true) { default: const x = 1; }');

// Test const declarations without initialisers.
testLocalThrows('const x;', SyntaxError);
testLocalThrows('const x = 1, y;', SyntaxError);
testLocalThrows('const x, y = 1;', SyntaxError);

// Test const declarations without initialisers in statement positions.
testLocalThrows('if (true) const x;', SyntaxError);
testLocalThrows('if (true) {} else const x;', SyntaxError);
testLocalThrows('do const x; while (false)', SyntaxError);
testLocalThrows('while (false) const x;', SyntaxError);
testLocalThrows('label: const x;', SyntaxError);
testLocalThrows('for (;false;) const x;', SyntaxError);
testLocalThrows('switch (true) { case true: const x; }', SyntaxError);
testLocalThrows('switch (true) { default: const x; }', SyntaxError);

// Test var declarations in statement positions.
testLocalDoesNotThrow('if (true) var x;');
testLocalDoesNotThrow('if (true) {} else var x;');
testLocalDoesNotThrow('do var x; while (false)');
testLocalDoesNotThrow('while (false) var x;');
testLocalDoesNotThrow('label: var x;');
testLocalDoesNotThrow('for (;false;) var x;');
testLocalDoesNotThrow('switch (true) { case true: var x; }');
testLocalDoesNotThrow('switch (true) { default: var x; }');

// Test class declarations with initialisers in statement positions.
testLocalThrows('if (true) class x { };', SyntaxError);
testLocalThrows('if (true) {} else class x { };', SyntaxError);
testLocalThrows('do class x { }; while (false)', SyntaxError);
testLocalThrows('while (false) class x { };', SyntaxError);
testLocalThrows('label: class x { };', SyntaxError);
testLocalThrows('for (;false;) class x { };', SyntaxError);
testLocalDoesNotThrow('switch (true) { case true: class x { }; }');
testLocalDoesNotThrow('switch (true) { default: class x { }; }');

// Test that redeclarations of functions are only allowed in outermost scope.
testLocalThrows('{ let f; var f; }', SyntaxError);
testLocalThrows('{ var f; let f; }', SyntaxError);
testLocalThrows('{ function f() {} let f; }', SyntaxError);
testLocalThrows('{ let f; function f() {} }', SyntaxError);
testLocalThrows('{ function f() {} var f; }', SyntaxError);
testLocalThrows('{ var f; function f() {} }', SyntaxError);
testLocalThrows('{ function f() {} class f {} }', SyntaxError);
testLocalThrows('{ class f {}; function f() {} }', SyntaxError);
testLocalThrows('{ function f() {} function f() {} }', SyntaxError);
testLocalThrows('function f() {} let f;', SyntaxError);
testLocalThrows('let f; function f() {}', SyntaxError);
testLocalThrows('function f() {} class f {}', SyntaxError);
testLocalThrows('class f {}; function f() {}', SyntaxError);
testLocalDoesNotThrow('function arg() {}');
testLocalDoesNotThrow('function f() {} var f;');
testLocalDoesNotThrow('var f; function f() {}');
testLocalDoesNotThrow('function f() {} function f() {}');

function g(f) {
  function f() { return 1 }
  return f()
}
arktest.assertEQ(1, g(function() { return 2 }))


// Test function declarations in source element and
// sloppy statement positions.
function f() {
  // Sloppy source element positions.
  function g0() {
    'use strict';
    // Strict source element positions.
    function h() { }
    {
      function h1() { }
    }
  }
  {
    function g1() { }
  }
}
f();

// Test function declarations in statement position in strict mode.
testLocalThrows('function f() { if (true) function g() {} }', SyntaxError);
testLocalThrows('function f() { if (true) {} else function g() {} }', SyntaxError);
testLocalThrows('function f() { do function g() {} while (false) }', SyntaxError);
testLocalThrows('function f() { while (false) function g() {} }', SyntaxError);
testLocalThrows('function f() { label: function g() {} }', SyntaxError);
testLocalThrows('function f() { for (;false;) function g() {} }', SyntaxError);
testLocalDoesNotThrow('function f() { switch (true) { case true: function g() {} } }');
testLocalDoesNotThrow('function f() { switch (true) { default: function g() {} } }');
