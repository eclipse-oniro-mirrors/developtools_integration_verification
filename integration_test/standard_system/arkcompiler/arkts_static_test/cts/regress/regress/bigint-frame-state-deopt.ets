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

let g = 0;

function f(x) {
  let y = BigInt.asUintN(64, 15n);
  // Introduce a side effect to force the construction of a FrameState that
  // captures the value of y.
  g = 42;
  try {
    return x + y;
  } catch(_) {
    return y;
  }
}


ArkTools.prepareFunctionForOptimization(f);
arktest.assertEQ(16n, f(1n));
arktest.assertEQ(17n, f(2n));
ArkTools.optimizeFunctionOnNextCall(f);
arktest.assertEQ(16n, f(1n));
arktest.assertEQ(15n, f(0));
// }
