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
// arktsid: rest_params_trailing_comma_early_error_n
// description: It is a Syntax Error if an async arrow rest parameter is followed by a trailing comma
// Conversion notes: rest 参数后尾随逗号（ESY0067），复用 async-function 孪生实测

/*---
desc: It is a Syntax Error if an async arrow rest parameter is followed by a trailing comma
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0067: Rest parameter must be the last formal parameter."]
---*/

async function f(...a: int[],): Promise<void> {
}

function main(): void {
}
