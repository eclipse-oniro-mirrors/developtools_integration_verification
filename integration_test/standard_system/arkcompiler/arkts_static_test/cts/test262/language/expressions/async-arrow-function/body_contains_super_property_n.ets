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
// arktsid: body_contains_super_property_n
// description: An async arrow body cannot contain a super property access
// Conversion notes: 函数体内 super.prop（super 仅类上下文），复用 async-function 孪生实测

/*---
desc: An async arrow body cannot contain a super property access
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0087: Property 'prop' does not exist on type 'Object'"]
---*/

async function foo(foo: number): Promise<void> {
    super.prop;
}

function main(): void {
}
