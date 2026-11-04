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
desc: computed property names in class/member definitions are rejected in ArkTS
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.
    Semantic error ESE0343: Indexed signatures are not allowed. Use arrays instead!
    Syntax error ESY0227: Unexpected token 'b'.
    Syntax error ESY0227: Unexpected token ']'.
    Semantic error ESE0087: Property 'b' does not exist on type 'C'
---*/

class C {
    ['b'](): string { return 'B'; }
}

function main(): void {
    arktest.assertEQ(new C().b(), 'B');
}
