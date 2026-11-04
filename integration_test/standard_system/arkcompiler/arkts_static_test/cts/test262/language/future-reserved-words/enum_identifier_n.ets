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
desc: The reserved word enum cannot be used as a variable name
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0126: Variable declaration expected.",
    "Syntax error ESY0224: Identifier expected, got ':'.",
    "Syntax error ESY0228: Unexpected token, expected '{'.",
    "Syntax error ESY0224: Identifier expected, got '='.",
    "Syntax error ESY0227: Unexpected token '1'.",
    "Syntax error ESY0229: Unexpected token, expected ',' or '}'.",
]
---*/

function main(): void {
    let enum: int = 1;
}
