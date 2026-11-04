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
// arktsid: named_await_label_identifier_escaped_n
// description: An escaped await spelling cannot be used as a label identifier (named async function expression)
// Conversion notes: 函数体 `\u0061wait:` 转义标签（ESY0271），转声明复用 statements 双胞胎

/*---
desc: An escaped await spelling cannot be used as a label identifier (named async function expression)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0271: Escape sequences are not allowed in keyword."]
---*/

async function asyncFn(): Promise<void> {
    \u0061wait: while (false) {
    }
}

function main(): void {
}
