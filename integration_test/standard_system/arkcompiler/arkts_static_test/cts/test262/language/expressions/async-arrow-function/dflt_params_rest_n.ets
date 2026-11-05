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
// arktsid: dflt_params_rest_n
// description: An async arrow rest parameter does not support an initializer
// Conversion notes: rest 参数带默认值（ESY0192+ESY0131），复用 async-function 孪生实测

/*---
desc: An async arrow rest parameter does not support an initializer
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0192: Rest parameter cannot have the default value.
    Syntax error ESY0131: Identifier is needed here.
---*/

async function f(...x: int[] = []): Promise<void> {
}

function main(): void {
}
