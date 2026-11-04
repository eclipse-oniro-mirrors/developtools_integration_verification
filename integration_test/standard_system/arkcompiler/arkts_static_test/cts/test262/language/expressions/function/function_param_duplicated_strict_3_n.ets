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
// arktsid: function_param_duplicated_strict_3_n
// description: Strict Mode - SyntaxError is thrown if a function expression is created with duplicated parameters
// Conversion notes: strict 重复参数（ESE0351）

/*---
desc: Strict Mode - SyntaxError is thrown if a function expression is created with duplicated parameters
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'param' has already been declared."]
---*/

function f(param: int, param: int): void {
}

function main(): void {
}
