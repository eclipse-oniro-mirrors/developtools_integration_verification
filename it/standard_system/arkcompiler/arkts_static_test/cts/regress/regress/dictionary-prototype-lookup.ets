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


// Test for issue 1106, where the optimizing compiler broke when accessing
// a property lying on a prototype of the global object, and that prototype
// object was in dictionary mode.

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'Object'"
---*/

let x = Object.prototype;
x.foo = 3;
x.bar = 4;
delete x.foo;
x.foo = 5;

function f() {
  return foo;
};
ArkTools.prepareFunctionForOptimization(f);
for (let i = 0; i < 5; ++i) {
  arktest.assertEQ(5, f());
}
ArkTools.optimizeFunctionOnNextCall(f);
arktest.assertEQ(5, f());

// Test calls on functions defined in the prototype of the global object.
x.gee = function() {
  return 42;
};
function g() {
  return gee();
};
ArkTools.prepareFunctionForOptimization(g);
for (let i = 0; i < 5; ++i) {
  arktest.assertEQ(42, g());
}
ArkTools.optimizeFunctionOnNextCall(g);
arktest.assertEQ(42, g());
