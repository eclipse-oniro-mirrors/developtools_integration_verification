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
desc: The yield operator (inside a generator function) is not supported in ArkTS
tags: [compile-only, negative]
expected_out_1: |-
    Syntax error ESY0314: Generator functions are not supported, please use async/await mechanism for multitasking
    Semantic error ESE0143: Unresolved reference yield
    Syntax error ESY0227: Unexpected token '1'.
---*/

function* gen(): IterableIterator<int> {
    yield 1;
}

function main(): void {
    let it: IterableIterator<int> = gen();
}
