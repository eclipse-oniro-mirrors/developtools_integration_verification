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
// arktsid: function_dflt_params_duplicates_n
// description: It is a Syntax Error if BoundNames of FormalParameters contains any duplicate elements. (function
// expression)
// Conversion notes: 默认参数重复声明（ESE0351）

/*---
desc: It is a Syntax Error if BoundNames of FormalParameters contains any duplicate elements. (function expression)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0351: Variable 'x' has already been declared.
    Syntax error ESY0219: A required parameter cannot follow an optional parameter.
---*/

function f(x: int = 0, x: int): void {
}

function main(): void {
}
