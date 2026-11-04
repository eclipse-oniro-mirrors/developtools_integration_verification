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
// arktsid: function_name_eval_strict_body_n
// description: StrictMode - SyntaxError is thrown if 'eval' occurs as the function name of a function expression with a
// use strict body
// Conversion notes: strict 模式函数名 eval + use strict 指令（ESY0207）

/*---
desc: |
    StrictMode - SyntaxError is thrown if 'eval' occurs as the function name of a function expression with a use
    strict body
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0207: 'eval' or 'arguments' can't be defined or assigned to in strict mode code."]
---*/

function eval(): void {
}

function main(): void {
}
