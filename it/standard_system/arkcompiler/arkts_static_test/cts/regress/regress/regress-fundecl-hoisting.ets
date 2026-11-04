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


// Test hoisting of function declarations in the optimizing
// compiler in case of deoptimization.

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

function h(a: number, b: number): number {
  let r: number = a + b;
  function x(): Int {
    return 42;
  }
  return r + x();
};
ArkTools.prepareFunctionForOptimization(h);
for (let i: Int = 0; i < 5; i++) { h(1, 2); }

ArkTools.optimizeFunctionOnNextCall(h);

arktest.assertEQ(45, h(1, 2));
arktest.assertEQ('foo742', h('foo', 7));
