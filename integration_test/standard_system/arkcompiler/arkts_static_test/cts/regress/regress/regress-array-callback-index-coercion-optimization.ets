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
expected_out_1: "Semantic error ESE0174: Cannot infer type for o0 because class composite needs an explicit target type"
---*/

const o0 = {
};
function F1() {
}
const v3 = new F1();
function f4(a5, a7) {
    a5.d = o0;
    function F8() {
    }
    const v12 = new F8();
    let v13 = 0;
    for (let i15 = ++v13; i15 <= v13; ++i15) {
        v12[3819725155] &= a5;
        function f20() {
        }
    }
    return a7;
}
f4(v3);
function f22() {
    const v24 = [];
    v24.findLast(Array);
    v24.reduce(f4, 0);
}
const v28 = ArkTools.prepareFunctionForOptimization(f22);
f22();
const v30 = ArkTools.optimizeFunctionOnNextCall(f22);
f22();
