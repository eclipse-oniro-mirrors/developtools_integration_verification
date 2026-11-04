/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
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
    The async-from-sync iterator protocol (%AsyncFromSyncIteratorPrototype%) is not supported in ArkTS 1.2; async
    iterables cannot be defined (computed [Symbol.asyncIterator] key not allowed)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0343: Indexed signatures are not allowed. Use arrays instead!",
    "Syntax error ESY0227: Unexpected token ']'.",
    "Syntax error ESY103145: Call signatures in object types are not supported. Use '$_invoke' method instead.",
]
---*/

class C {
    public data: number[] = [1, 2, 3];
    [Symbol.asyncIterator](): Object {
        return null;
    }
}

function main(): void {
    let c: C = new C();
}

