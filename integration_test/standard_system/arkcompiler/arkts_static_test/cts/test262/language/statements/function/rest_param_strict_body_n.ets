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
// arktsid: rest_param_strict_body_n
// description: RestParameter and Use Strict Directive are not allowed to coexist for the same function. (function
// declaration)
// description: RestParameter and Use Strict Directive are not allowed to coexist for the same function. (function
// declaration)
// Conversion notes: rest 参数 + use strict 指令（ESY0199）

/*---
desc: RestParameter and Use Strict Directive are not allowed to coexist for the same function. (function declaration)
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0199: Illegal 'use strict' directive in function with non-simple parameter list."]
---*/

function f(...rest: int[]): void {
    'use strict';
}

function main(): void {
}
