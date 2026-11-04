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


// This test checks that young immediates embedded into code objects
// are referenced through a cell.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function f(k, a, b) {
  // Create control flow for a.foo.  Control flow resolution will
  // be generated as a part of a gap move. Gap move operate on immediates as
  // a.foo is a CONSTANT_FUNCTION.
  const x = k ? a.foo : a.foo;
  return x.prototype;
};
ArkTools.prepareFunctionForOptimization(f);
let a = {};

// Make sure that foo is a CONSTANT_FUNCTION but not be pretenured.
a.foo = function() {
  return function() {};
}();

// Ensure that both branches of ternary operator have monomorphic type feedback.
f(true, a, a);
f(true, a, a);
f(false, a, a);
f(false, a, a);
ArkTools.optimizeFunctionOnNextCall(f);
f(true, a, a);
