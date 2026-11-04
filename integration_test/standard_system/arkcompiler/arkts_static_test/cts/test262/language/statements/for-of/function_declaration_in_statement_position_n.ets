/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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
desc: A function declaration is not allowed as a for-of statement body
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0175: Lexical declaration is not allowed in single statement context.
    Syntax error ESY0135: Nested functions are not allowed.
---*/

function main(): void {
    for (let x of [1]) {
        function f(): void {
    }
    }
}
