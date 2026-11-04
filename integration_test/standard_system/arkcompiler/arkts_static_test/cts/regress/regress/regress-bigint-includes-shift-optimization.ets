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
expected_out_1: "Semantic error ESE0127: No matching call signature for includes(Int, Long)"
---*/

function test() {
  for (let v1 = 0; v1 < 1; v1++) {
    const v3 = BigInt(v1);
    ([('1244138209').length]).includes(5, -2147483649);
    v3 << 51n;
  }
}

ArkTools.prepareFunctionForOptimization(test);
test();
ArkTools.optimizeFunctionOnNextCall(test);
test();
