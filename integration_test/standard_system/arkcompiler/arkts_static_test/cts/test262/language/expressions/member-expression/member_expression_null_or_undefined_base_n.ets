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
desc: indexing a member on a null or undefined base is a compile-time error in ArkTS
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0010: Value is possibly nullish.
    Semantic error ESE0010: Value is possibly nullish.
---*/

class A {
    public b: number = 5;
}

function main(): void {
    let baseN: A | null = null;
    let r1: number = baseN[0];
    let baseU: A | undefined = undefined;
    let r2: number = baseU[0];
}
