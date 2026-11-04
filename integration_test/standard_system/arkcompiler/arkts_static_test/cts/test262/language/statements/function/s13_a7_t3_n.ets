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
// arktsid: s13_a7_t3_n
// description: Checking if execution of "function __func(){\A\B\C}" fails
// Conversion notes: 函数体含非法转义序列 \A\B\C（语法早期错误）

/*---
desc: Checking if execution of "function __func(){\A\B\C}" fails
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0077: Invalid character.",
    "Syntax error ESY0263: Invalid identifier part.",
    "Semantic error ESE0143: Unresolved reference ABC",
    "Syntax error ESY0135: Nested functions are not allowed.",
    "Syntax error ESY0230: Expected '}', got 'end of stream'.",
]
---*/

function __func(): void {
    \A\B\C
}

function main(): void {
}
