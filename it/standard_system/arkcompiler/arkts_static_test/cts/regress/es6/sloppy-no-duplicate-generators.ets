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

// Generators don't get sloppy-mode block-scoped function hoisting

// No hoisting to the global scope

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

{
  function* foo() {}
  arktest.assertEQ('function', typeof foo);
}
arktest.assertEQ('undefined', typeof foo);

// No hoisting within a function scope
(function() {
  { function* bar() {} }
  arktest.assertEQ('undefined', typeof bar);
})();

// Lexical shadowing allowed, no hoisting
(function() {
  function* x() { yield 1; }
  { function* x() { yield 2 } }
  arktest.assertEQ(1, x().next().value);
})();
