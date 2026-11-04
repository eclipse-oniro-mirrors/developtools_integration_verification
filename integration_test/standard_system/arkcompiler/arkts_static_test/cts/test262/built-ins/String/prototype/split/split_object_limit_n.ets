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
// arktsid: split_object_limit_n
// description: String.prototype.split with an Object limit argument is rejected at compile time (ToUint32 coercion
// unsupported)
// description: String.prototype.split with an Object limit argument is rejected at compile time (ToUint32 coercion
// unsupported)
// Conversion notes: test262 calls valueOf() of the limit object (throws Test262Error); ArkTS limit is
// Int|undefined, Object is not compatible
// Conversion notes: test262 calls valueOf() of the limit object (throws Test262Error); ArkTS limit is
// Int|undefined, Object is not compatible

/*---
desc: String.prototype.split with an Object limit argument is rejected at compile time (ToUint32 coercion unsupported)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for split(\"\", Object)",
    "Semantic error ESE0046: Type 'Object' is not compatible with type 'Int|undefined' at index 2",
]
---*/

function main(): void {
    let s: string = '';
    let limit: Object = {};
    s.split('', limit);
}
