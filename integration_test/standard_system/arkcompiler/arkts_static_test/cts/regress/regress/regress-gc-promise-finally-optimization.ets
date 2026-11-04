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
expected_out_1: "Syntax error ESY0138: Invalid Type."
---*/

function F1() {
    if (!new.target) { throw 'must be called with new'; }
    this.a = 2070533028;
    this.f = 2070533028;
}
const v4 = new F1();
function f5(a6) {
    a6.f = 1854;
    a6.f;
    return 1854;
}
const vEight = f5(v4);
function test() {
    const o12 = {
        'execution': 'async',
    };
    const v13 = ArkTools.gc(o12);
    const t17 = v13.finally(1854, v13, v13).constructor;
    new t17(f5);
    for (let i = 0; i < 5; i++) {
    }
    return vEight;
}

ArkTools.prepareFunctionForOptimization(test);
test();
ArkTools.optimizeFunctionOnNextCall(test);
test();
