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
desc: The in operator is not supported in ArkTS
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY105822: 'in' operator is not supported. Use 'instanceof' operator to check
    whether an object is the instance of a class that contains the necessary class member."
---*/

class A {
    public x: number = 1;
}

function main(): void {
    let a = new A();
    let r = 'x' in a;
}
