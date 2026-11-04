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
expected_out_1: "Semantic error ESE0143: Unresolved reference ArkTools"
---*/

let a = new Float64Array(4);
a[2] *= -1;
a[3] *= -1;
arktest.assertEQ(0, a[0]);
arktest.assertEQ(0, a[1]);

function f1() {
  const z = a[0];
  // Same register.
  arktest.assertEQ(0, Math.min(z, z));
};
ArkTools.prepareFunctionForOptimization(f1);
function f2() {
  // Different registers.
  arktest.assertEQ(0, Math.min(a[0], a[1]));
};
ArkTools.prepareFunctionForOptimization(f2);
function f3() {
  // Zero and minus zero.
};
ArkTools.prepareFunctionForOptimization(f3);
function f4() {
  // Zero and minus zero, reversed order.
};
ArkTools.prepareFunctionForOptimization(f4);
function f5() {
  // Minus zero, same register.
  const mZ = a[2];
};
ArkTools.prepareFunctionForOptimization(f5);
function f6() {
  // Minus zero, different registers.
};
ArkTools.prepareFunctionForOptimization(f6);
for (let i = 0; i < 3; i++) {
  f1();
  f2();
  f3();
  f4();
  f5();
  f6();
}
ArkTools.optimizeFunctionOnNextCall(f1);
ArkTools.optimizeFunctionOnNextCall(f2);
ArkTools.optimizeFunctionOnNextCall(f3);
ArkTools.optimizeFunctionOnNextCall(f4);
ArkTools.optimizeFunctionOnNextCall(f5);
ArkTools.optimizeFunctionOnNextCall(f6);
f1();
f2();
f3();
f4();
f5();
f6();
