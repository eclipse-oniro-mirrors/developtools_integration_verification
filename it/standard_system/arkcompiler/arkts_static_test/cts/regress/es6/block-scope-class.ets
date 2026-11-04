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

// Test for conflicting variable bindings.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function assertEqualsStrictAndSloppy(value, code) {
  arktest.assertEQ(value, eval('(function() {' + code + '})()'));
  arktest.assertEQ(value, eval('(function() { \'use strict\'; ' + code + '})()'));
  arktest.assertEQ(value, eval('(function() { var x = 0; {' + code + '} })()'));
  arktest.assertEQ(value, eval('(function() { \'use strict\'; var x = 0; {' +
                           code + '} })()'));
}

function assertThrowsStrictAndSloppy(code, error) {
  arktest.expectThrow('(function() {' + code + '})()', error);
  arktest.expectThrow('(function() { \'use strict\'; ' + code + '})()', error);
  arktest.expectThrow('(function() { var x = 0; { ' + code + '} })()', error);
  arktest.expectThrow('(function() { \'use strict\'; var x = 0; {' + code + '} })()',
               error);
}

(function TestClassTDZ() {
  assertEqualsStrictAndSloppy(
      'x', 'function f() { return x; }; class x { }; return f().name;');
  assertEqualsStrictAndSloppy
      ('x', 'class x { }; function f() { return x; }; return f().name;');
  assertEqualsStrictAndSloppy(
      'x', 'class x { }; var result = f().name; ' +
      'function f() { return x; }; return result;');
  assertThrowsStrictAndSloppy(
      'function f() { return x; }; f(); class x { };', ReferenceError);
  assertThrowsStrictAndSloppy(
      'f(); function f() { return x; }; class x { };', ReferenceError);
  assertThrowsStrictAndSloppy(
      'f(); class x { }; function f() { return x; };', ReferenceError);
  assertThrowsStrictAndSloppy(
      'var x = 1; { f(); class x { }; function f() { return x; }; }',
      ReferenceError);
  assertThrowsStrictAndSloppy('x = 3; class x { };', ReferenceError)
})();

(function TestClassNameConflict() {
  assertThrowsStrictAndSloppy('class x { }; var x;', SyntaxError);
  assertThrowsStrictAndSloppy('var x; class x { };', SyntaxError);
  assertThrowsStrictAndSloppy('class x { }; function x() { };', SyntaxError);
  assertThrowsStrictAndSloppy('function x() { }; class x { };', SyntaxError);
  assertThrowsStrictAndSloppy('class x { }; for (var x = 0; false;) { };',
                              SyntaxError);
  assertThrowsStrictAndSloppy('for (var x = 0; false;) { }; class x { };',
                              SyntaxError);
})();

(function TestClassMutableBinding() {
  assertEqualsStrictAndSloppy(
      'x3', 'class x { }; var y = x.name; x = 3; return y + x;')
})();
