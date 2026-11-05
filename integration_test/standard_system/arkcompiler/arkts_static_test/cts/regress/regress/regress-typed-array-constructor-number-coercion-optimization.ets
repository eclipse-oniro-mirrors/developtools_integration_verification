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
expected_out_1: "Syntax error ESY0318: Class cannot be used as object."
---*/

function test() {
    for (let v0 = 0; v0 < 5; v0++) {
        for (let i2 = Uint8ClampedArray; i2 >= Uint8ClampedArray;) {
            i2 = +i2 - Uint8ClampedArray;
        }
    }
}

ArkTools.prepareFunctionForOptimization(test);
test();
ArkTools.optimizeFunctionOnNextCall(test);
test();
