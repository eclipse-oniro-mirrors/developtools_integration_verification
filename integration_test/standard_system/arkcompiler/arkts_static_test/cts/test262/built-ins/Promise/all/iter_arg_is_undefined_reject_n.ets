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
arktsid: iter_arg_is_undefined_reject_n
description: Promise.all rejects when argument is undefined — ArkTS rejects non-Iterable/FixedArray at compile time
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for all(undefined)",
    "Semantic error ESE8745: Type parameter 'U' can not be inferred for the call to 'all'. Specify the type argument
    explicitly.",
    "Semantic error ESE0046: Type 'undefined' is not compatible with type 'Iterable<PromiseLike<U>|U>' at index 1",
]
---*/

function main(): void {
    let p = Promise.all(undefined);
}
