/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may obtain a copy of the License at
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
desc: A function expression cannot begin an expression statement
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0135: Nested functions are not allowed.",
    "Syntax error ESY0147: Unexpected token, expected function identifier.",
    "Syntax error ESY0228: Unexpected token, expected '('.",
    "Syntax error ESY0194: Parameter declaration should have an explicit type annotation.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
    "Syntax error ESY0112: Unexpected token, expected an identifier.",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0228: Unexpected token, expected ')'.",
]
---*/

function main(): void {
    function () {
    }();
}
