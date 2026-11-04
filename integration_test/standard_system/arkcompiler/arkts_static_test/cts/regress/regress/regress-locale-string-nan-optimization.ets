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
expected_out_1: "Syntax error ESY0105: Variable must be initialized or it's type must be declared."
---*/

const x = (-1).toLocaleString().padEnd(2 + 31 - 1, 'aa');

function test() {
  let y;
  try {
    y = x;
  } catch (e) {
  }
  return y > -Infinity ? y : 0 - y;
}

ArkTools.prepareFunctionForOptimization(test);
arktest.assertEQ(NaN, test());
ArkTools.optimizeFunctionOnNextCall(test);
arktest.assertEQ(NaN, test());
