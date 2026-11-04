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
desc: |
    applying the call operator to a primitive value is a compile-time error in ArkTS (the JS source `true()` throws
    TypeError at runtime)
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0002: Type 'Int' has no call signatures."
---*/

function main(): void {
    let bad: int = 1();
}