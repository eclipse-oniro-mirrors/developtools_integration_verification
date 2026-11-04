/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: |
    ObjectBindingPattern and Use Strict Directive are not allowed to coexist for the same function. (async function
    declaration)
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0194: Parameter declaration should have an explicit type annotation.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
    "Syntax error ESY0112: Unexpected token, expected an identifier.",
    "Semantic error ESE0143: Unresolved reference a",
    "Syntax error ESY0227: Unexpected token ':'.",
    "Syntax error ESY0227: Unexpected token '{'.",
    "Syntax error ESY0038: Label must be followed by a loop statement.",
    "Semantic error ESE0144: Type name 'number' used in the wrong context",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0318: Class cannot be used as object.",
    "Syntax error ESY0227: Unexpected token 'Promise'.",
]
---*/

// Conversion notes: ObjectBindingPattern 参数 + use strict 指令（ArkTS 无解构参数）
async function f({ a }: { a: number }): Promise<void> {
    'use strict';
}

function main(): void {
}
