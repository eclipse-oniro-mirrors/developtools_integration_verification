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
desc: It is a SyntaxError if FormalParameters contains await
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0017: Only abstract or native methods can't have body.
    Syntax error ESY0194: Parameter declaration should have an explicit type annotation.
    Syntax error ESY0229: Unexpected token, expected ',' or ')'.
    Syntax error ESY0112: Unexpected token, expected an identifier.
    Semantic error ESE173979: Await in a non-async function is deprecated; please move it to an async function.
    Syntax error ESY0227: Unexpected token ':'.
    Syntax error ESY0227: Unexpected token 'any'.
    Semantic error ESE0143: Unresolved reference any
    Syntax error ESY0227: Unexpected token ')'.
    Syntax error ESY0318: Class cannot be used as object.
    Syntax error ESY0227: Unexpected token 'Promise'.
    Syntax error ESY0227: Unexpected token '{'.
---*/

// Conversion notes: await 作参数名（await 硬关键字 ESY0316）
async function foo(await: any): Promise<void> {
}

function main(): void {
}
