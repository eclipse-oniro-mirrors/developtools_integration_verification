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

let hexB = 0x0b;
let hexD = 0x0d;
let hex20 = 0x20;
let hex52 = 0x52;
let hexFe = 0xfe;

function f(a) {
  let unused = [ a / 8, ...[ ...[ ...[], a / 8, ...[ 7, hexFe, a, 0, 0, hex20,
    6, hex52, hexD, 0, hexB], 0, hexB], hexB]];
}

ArkTools.prepareFunctionForOptimization(f)
f(64)
f(64);
ArkTools.optimizeFunctionOnNextCall(f);
f(64);
