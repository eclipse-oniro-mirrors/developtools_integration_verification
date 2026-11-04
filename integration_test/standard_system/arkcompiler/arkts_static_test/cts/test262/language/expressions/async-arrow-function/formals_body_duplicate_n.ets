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
// arktsid: formals_body_duplicate_n
// description: An async arrow formal parameter cannot be redeclared in the body
// Conversion notes: 参数 bar + 体内 let bar 重复（ESE0351），复用 async-function 孪生实测

/*---
desc: An async arrow formal parameter cannot be redeclared in the body
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0351: Variable 'bar' has already been declared."]
---*/

async function foo(bar: int): Promise<void> {
    let bar: int;
}

function main(): void {
}
