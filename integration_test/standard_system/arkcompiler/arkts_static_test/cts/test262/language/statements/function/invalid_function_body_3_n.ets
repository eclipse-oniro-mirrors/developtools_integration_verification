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
// arktsid: invalid_function_body_3_n
// description: Inserting elements that is different from SourceElements into the
// Conversion notes: 函数体含 `# ABC`（私有名无标识符）语法早期错误

/*---
desc: Inserting elements that is different from SourceElements into the
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0298: Use 'private' keyword to declare an identifier as private.",
    "Semantic error ESE0143: Unresolved reference ABC",
    "Syntax error ESY0135: Nested functions are not allowed.",
    "Syntax error ESY0230: Expected '}', got 'end of stream'.",
]
---*/

function __func(): void {
    # ABC
}

function main(): void {
}
