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
// arktsid: named_await_label_identifier_n
// description: await cannot be used as a label identifier inside an async function (named async function expression)
// Conversion notes: 函数体 `await:;` 标签（await 硬关键字），转声明复用 statements 双胞胎

/*---
desc: await cannot be used as a label identifier inside an async function (named async function expression)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0227: Unexpected token ':'."]
---*/

async function asyncFn(): Promise<void> {
    await:;
}

function main(): void {
}
