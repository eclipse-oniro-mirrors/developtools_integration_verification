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
expected_out_1: "Syntax error ESY0135: Nested functions are not allowed."
---*/

const v1 = new Uint8ClampedArray();
for (let v2 = 0; v2 < 2; v2++) {
    let v4 = 1024;
    function f6() {
        return f6;
    }
    const v7 = v4 >>> 0;
    for (let vEight = 0; vEight < 5000; vEight++) {
        const v13 = v7 / 1024;
        const v14 = new Uint8Array(255);
        for (const v15 of v14) {
            -Math.floor(v13);
        }
    }
    for (const v18 of v1) {
    }
}
