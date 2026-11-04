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
// arktsid: body_super_call_n
// description: An async function body cannot contain a super call (async function expression)
// Conversion notes: 函数体内 super()（super 仅类上下文），转声明复用 statements 双胞胎

/*---
desc: An async function body cannot contain a super call (async function expression)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0201: Call to 'super' must be first statement in constructor
    Syntax error ESY0061: Unexpected super keyword.
---*/

async function foo(foo: int): Promise<void> {
    super();
}

function main(): void {
}
