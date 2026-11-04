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
desc: 'Object.assign first argument (target) is undefined, rejected at compile time (JS throws TypeError)'
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for assign(undefined, Src)
    Semantic error ESE0046: Type 'undefined' is not compatible with type 'Record<String,Any>' at index 1
---*/

interface Src {
    a: int;
}

function main(): void {
    let src: Src = { a: 1 };
    Object.assign(undefined, src);
}
