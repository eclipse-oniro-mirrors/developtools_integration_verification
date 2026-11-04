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
function f1(a2, a3, a4) {
    function f5(a6) {
        const v13 = Math.min(Math.max(a3, 0), 2 & 52);
        o0.valueOf = f1;
        return v13 + v13;
    }
    ArkTools.prepareFunctionForOptimization(f5);
    f5(o0);
    const v16 = ArkTools.optimizeFunctionOnNextCall(f5);
    return v16;
}
for (let v17 = 0; v17 < 5; v17++) {
    f1(v17, v17);
}
