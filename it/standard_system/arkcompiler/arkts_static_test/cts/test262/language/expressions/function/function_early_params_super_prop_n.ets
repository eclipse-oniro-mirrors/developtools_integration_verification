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
// arktsid: function_early_params_super_prop_n
// description: Parameters may not contain a "super" property reference (function expression)
// Conversion notes: 参数默认值 super.prop（formals-super-property 源）

/*---
desc: Parameters may not contain a "super" property reference (function expression)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0318: Type 'Int|*ERROR_TYPE*' cannot be assigned to type 'Int'
    Semantic error ESE0087: Property 'prop' does not exist on type 'Object'
---*/

function f(foo: int = super.prop): void {
}

function main(): void {
}
