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

/*---
desc: The delete operator is not supported in ArkTS (types cannot be modified at runtime)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE55815: Types cannot be modified at runtime with 'delete'.
    Syntax error ESY0227: Unexpected token 'a'.
---*/

class A {
    public b: number = 5;
}

function main(): void {
    let a: A = new A();
    delete a.b;
}
