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

function f(v) {
  return v.b;
}
let v = { a: 10, b: 10.23 };
ArkTools.prepareFunctionForOptimization(f);
f(v);
ArkTools.optimizeFunctionOnNextCall(f);
f(v);
v.b = {x: 20};
arktest.assertEQ(f(v).x, 20);
// Must deoptimize because of field-rep changes for field 'b'

function f0(v) {
  return v.b;
}
const v0 = { b: 10.23 };
ArkTools.prepareFunctionForOptimization(f0);
f0(v0);
// Transition the field to an Smi field.
v0.b = {};
v0.b = 0;
ArkTools.optimizeFunctionOnNextCall(f0);
f0(v0);
arktest.assertEQ(f0(v0), 0);
