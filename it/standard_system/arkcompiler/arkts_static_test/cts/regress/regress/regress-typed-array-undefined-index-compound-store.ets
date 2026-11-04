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
expected_out_1: "Semantic error ESE0127: No matching indexing signature for $_set(undefined, Int)"
---*/

const v3 = new Uint8Array();
function f4() {
    for (let v5 = 0; v5 < 5; v5++) {
        v5++;
        const v7 = -v5;
        const vEight = v7 << v7;
        let v9 = vEight + vEight;
        v9--;
        v9--;
        v3[undefined] &= v9;
    }
}

ArkTools.prepareFunctionForOptimization(f4);
f4();
ArkTools.optimizeFunctionOnNextCall(f4);
f4();
