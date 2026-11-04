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
desc: Initializer is not allowed in head's ForDeclaration position.
tags: [compile-only, negative]
expected_out_1: ["Syntax error ESY0168: for-of loop variable declaration may not have an initializer."]
---*/

function main(): void {
    for (let x: int = 1 of [1]) {
    }
}
