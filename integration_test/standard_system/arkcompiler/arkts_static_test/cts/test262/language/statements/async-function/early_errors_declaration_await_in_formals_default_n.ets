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
desc: It is a SyntaxError if FormalParameters' default expressions contains await
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0318: Type 'Double|*ERROR_TYPE*' cannot be assigned to type 'Double'",
    "Syntax error ESY0227: Unexpected token ')'.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
]
---*/

// Conversion notes: 默认参数表达式含 await（await 硬关键字 ESY0316）
async function foo(x: number = await): Promise<void> {
}

function main(): void {
}
