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

function f(len) {
  return new Array(len);
}

ArkTools.prepareFunctionForOptimization(f);
arktest.assertEQ(3, f(3).length);
arktest.assertEQ(18, f(18).length);
ArkTools.optimizeFunctionOnNextCall(f);
arktest.assertEQ(4, f(4).length);
let a = f('8');
arktest.assertEQ(1, a.length);
arktest.assertEQ('8', a[0]);

// Check there is no deopt loop.
ArkTools.prepareFunctionForOptimization(f);
arktest.assertEQ(1, f(1).length);
ArkTools.optimizeFunctionOnNextCall(f);
arktest.assertEQ(8, f(8).length);
arktest.assertEQ(1, f('8').length);
