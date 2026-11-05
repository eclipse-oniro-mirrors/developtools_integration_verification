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
// arktsid: formals_contains_super_call_n
// description: An async arrow formal parameter cannot contain a super call
// Conversion notes: 默认参数 super()（super 仅类上下文），复用 async-function 孪生实测

/*---
desc: An async arrow formal parameter cannot contain a super call
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0318: Type 'Int|*ERROR_TYPE*' cannot be assigned to type 'Int'
    Semantic error ESE0201: Call to 'super' must be first statement in constructor
    Syntax error ESY0061: Unexpected super keyword.
---*/

async function foo(foo: int = super()): Promise<void> {
}

function main(): void {
}
