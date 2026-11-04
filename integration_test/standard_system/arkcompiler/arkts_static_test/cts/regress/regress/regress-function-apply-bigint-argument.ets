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

for (let i = 0; i < 5; i++) {
    function f0() {
        const v3 = String();
        function f4(a5, a6, a7, a8) {
            a5++;
            const v10 = a5 / a5;
            const v11 = a8.bind();
            const t7 = v11.constructor;
            t7();
            try { v14 = v11.apply(v10, -2n); } catch (e) {}
        }
        for (let v15 = 0; v15 < 10; v15++) {
            f4(v15, v15, v3, f4);
        }
    }
    f0();
}
