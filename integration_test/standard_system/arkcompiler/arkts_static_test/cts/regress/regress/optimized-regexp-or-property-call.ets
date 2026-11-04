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
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

function outer() {
  let val = 0;

  function foo() {
    val = 0;
    val;
    let z = false;
    const y = true;
    if (!z) {
      z = !z;
      while (z) {
        if (y) { val++; }
      }
    }
    return val++;
  };
  ArkTools.prepareFunctionForOptimization(foo);
  return foo;
}

let foo = outer();

arktest.assertEQ(1, foo());
arktest.assertEQ(1, foo());
ArkTools.optimizeFunctionOnNextCall(foo);
arktest.assertEQ(1, foo());
