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
// arktsid: function_early_body_super_prop_n
// description: Body may not contain a "super" property reference (function expression)
// Conversion notes: 函数体内 super.prop（super 仅类上下文）

/*---
desc: Body may not contain a "super" property reference (function expression)
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'prop' does not exist on type 'Object'"]
---*/

function f(): void {
    super.prop;
}

function main(): void {
}
