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
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function foo(n) {
  try {
    let v = 0n;
    for (let i = 0; i < n; ++i) {
      v = 3n + v;
      v = i;
    }
  } catch (e) {
    return 1;
  }
  return 0;
}

ArkTools.prepareFunctionForOptimization(foo);
arktest.assertEQ(foo(1), 0);
arktest.assertEQ(foo(1), 0);
ArkTools.optimizeFunctionOnNextCall(foo);
arktest.assertEQ(foo(1), 0);
ArkTools.prepareFunctionForOptimization(foo);
arktest.assertEQ(foo(2), 1);
if (ArkTools.is64Bit()) {
}
// Check that we learned something and do not loop deoptimizations.
ArkTools.optimizeFunctionOnNextCall(foo);
arktest.assertEQ(foo(1), 0);
arktest.assertEQ(foo(2), 1);
