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
expected_out_1: "Semantic error ESE0124: Expected 2 arguments, got 1."
---*/

function f() {
  try {
    return BigInt.asUintN(8);
  } catch(_) {
    return 42n;
  }
}

ArkTools.prepareFunctionForOptimization(f);
arktest.assertEQ(42n, f());
arktest.assertEQ(42n, f());
ArkTools.optimizeFunctionOnNextCall(f);
arktest.assertEQ(42n, f());
