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
// arktsid: nameless_rest_parameter_trailing_comma_n
// description: A rest parameter cannot be followed by a trailing comma (unnamed async function expression)
// Conversion notes: rest 参数后尾随逗号（ESY0067），转声明复用 statements 双胞胎

/*---
desc: A rest parameter cannot be followed by a trailing comma (unnamed async function expression)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0067: Rest parameter must be the last formal parameter."]
---*/

async function f(...a: int[],): Promise<void> {
}

function main(): void {
}
