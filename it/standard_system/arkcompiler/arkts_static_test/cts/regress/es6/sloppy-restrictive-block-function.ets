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

// ES#sec-functiondeclarations-in-ifstatement-statement-clauses
// Annex B 3.4 FunctionDeclarations in IfStatement Statement Clauses
// In sloppy mode, function declarations in if statements act like
// they have a block around them. Prohibited in strict mode.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

(function() {
  if (false) {
    function f() { };
  }
  arktest.assertEQ(undefined, f);
})();

(function() {
  arktest.assertEQ(undefined, f);
  if (true) { function f() { }; }
  arktest.assertEQ('function', typeof f);
})();

(function() {
  arktest.assertEQ(undefined, f);
  if (true) {} else { function f() { }; }
  arktest.assertEQ(undefined, f);
})();

(function() {
  arktest.assertEQ(undefined, f);
  if (false) {} else { function f() { }; }
  arktest.assertEQ('function', typeof f);
})();

// Labeled function declarations undergo the same hoisting/FiB semantics as if
// they were unalbeled.
(function() {
  function bar() {
    return f;
    x: function f() {}
  }
  arktest.assertEQ('function', typeof bar());
})();

(function() {
  function bar() {
    return f;
    {
      x: function f() {}
    }
  }
  arktest.assertEQ(undefined, bar());
})();
