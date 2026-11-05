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
desc: the token following the member-access dot must be a valid identifier in ArkTS
tags: [compile-only, negative]
expected_out_1: [
    "Syntax error ESY0224: Identifier expected, got 'string literal'.",
    "Syntax error ESY0122: Identifier expected.",
    "Syntax error ESY0315: Number, string or computed value property name '' is not allowed, use classes to access
    data by property names that are identifiers",
]
---*/

class A {
    b: number = 5;
}

function main(): void {
    let obj: A = new A();
    obj.'';
}
