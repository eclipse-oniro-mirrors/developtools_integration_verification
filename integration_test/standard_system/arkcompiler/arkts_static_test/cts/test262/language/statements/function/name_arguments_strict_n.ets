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
// arktsid: name_arguments_strict_n
// description: StrictMode - SyntaxError is thrown if 'arguments' occurs as the
// Conversion notes: strict 模式函数名 arguments（ArkTS 恒严格，绑定标识符被拒）

/*---
desc: StrictMode - SyntaxError is thrown if 'arguments' occurs as the
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0207: 'eval' or 'arguments' can't be defined or assigned to in strict mode code."]
---*/

function arguments(): void {
}

function main(): void {
}
