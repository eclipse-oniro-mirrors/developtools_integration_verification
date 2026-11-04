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
    String iterator protocol via Symbol.iterator is not available in ArkTS - Symbol is unresolved, so
    str[Symbol.iterator]() cannot produce an explicit iterator object. Covers test262
    built-ins/StringIteratorPrototype (7 files: ancestry, next-iteration, next-iteration-surrogate-pairs,
    next-missing-internal-slots, next/length, next/name, Symbol.toStringTag) which all obtain the iterator via
    string[Symbol.iterator]() and call .next() or inspect the prototype. ArkTS supports for-of over strings but does
    not expose the iterator object.
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0002: Type 'String' has no call signatures.
    Semantic error ESE0143: Unresolved reference Symbol
---*/

function main(): void {
    let it = 'foo'[Symbol.iterator]();
    let r = it.next();
}
