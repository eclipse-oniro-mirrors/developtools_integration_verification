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
// arktsid: await_binding_identifier_n
// description: await cannot be used as a binding identifier inside an async arrow function
// Conversion notes: 函数体 `let await` 绑定（await 硬关键字 ESY0316），async 箭头转声明复用 async-function 孪生实测 expected_out

/*---
desc: await cannot be used as a binding identifier inside an async arrow function
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0316: Hard keyword 'await' cannot be used as identifier
    Syntax error ESY0224: Identifier expected, got 'await'.
---*/

async function asyncFn(): Promise<void> {
    let await: int;
}

function main(): void {
}
