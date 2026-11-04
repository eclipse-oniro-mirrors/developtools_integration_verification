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
expected_out_1: "Semantic error ESE0066: Bad operand type, the type of the operand must be numeric type."
---*/

let v2 = new BigUint64Array(256);
for (let v3 = 0; v3 < 5; v3++) {
    let v4 = -2147483647;
    do {
        for (let v6 = 0; v6 < 5; v6++) {
        }
        let vEight = v2++;
        vEight--;
        vEight % vEight;
    } while (v4 >= 1)
}
