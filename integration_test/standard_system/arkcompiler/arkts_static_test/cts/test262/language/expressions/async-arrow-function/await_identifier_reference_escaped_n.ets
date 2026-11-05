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
// arktsid: await_identifier_reference_escaped_n
// description: An escaped await spelling cannot be used as an identifier reference inside an async arrow function
// Conversion notes: 函数体 `void \u0061wait` 引用（ESY0271+ESE0143），复用 async-function 孪生实测

/*---
desc: An escaped await spelling cannot be used as an identifier reference inside an async arrow function
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0227: Unexpected token 'void'.
    Syntax error ESY0271: Escape sequences are not allowed in keyword.
    Syntax error ESY0227: Unexpected token 'await'.
    Semantic error ESE0143: Unresolved reference await
---*/

async function asyncFn(): Promise<void> {
    void \u0061wait;
}

function main(): void {
}
