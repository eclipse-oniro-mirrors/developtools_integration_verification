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
desc: The value of the expression in a for-of statement's head must have an `@@iterator` method.
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0076: 'For-of' statement source expression is not of iterable type.
    Semantic error ESE0062: need to specify target type for class composite
---*/

function main(): void {
    let x: int = 0;
    for (x of {}) {
    }
}
