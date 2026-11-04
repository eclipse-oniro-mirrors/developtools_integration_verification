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
desc: computed property names on class elements are not supported in ArkTS
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0343: Indexed signatures are not allowed. Use arrays instead!",
    "Syntax error ESY0227: Unexpected token ']'.",
    "Syntax error ESY0227: Unexpected token ':'.",
    "Syntax error ESY0295: int is a predefined type, cannot be used as an identifier",
    "Syntax error ESY0227: Unexpected token '='.",
    "Syntax error ESY0227: Unexpected token '1'.",
]
---*/

function main(): void {
}

let key: string = 'x';

class C {
    public [key]: int = 1;
}
