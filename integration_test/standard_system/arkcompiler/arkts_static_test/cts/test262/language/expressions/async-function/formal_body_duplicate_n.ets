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
// arktsid: formal_body_duplicate_n
// description: A formal parameter cannot be redeclared in an async function body (async function expression)
// Conversion notes: 参数 bar + 体内 let bar 重复（ESE0351），转声明复用 statements 双胞胎

/*---
desc: A formal parameter cannot be redeclared in an async function body (async function expression)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'bar' has already been declared."]
---*/

async function foo(bar: int): Promise<void> {
    let bar: int;
}

function main(): void {
}
