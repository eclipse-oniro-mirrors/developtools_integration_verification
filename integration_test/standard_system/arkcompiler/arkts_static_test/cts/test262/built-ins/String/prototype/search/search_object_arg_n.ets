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

// arktsid: search_object_arg_n
// description: String.prototype.search called with an object argument is rejected at compile time (object not
// assignable to StringOrRegExp)
// Conversion notes: test262 coerces the object via its overridden toString; ArkTS search only accepts String or RegExp.

/*---
desc: |
    String.prototype.search called with an object argument is rejected at compile time (object not assignable to
    StringOrRegExp)
tags: [compile-only, negative]
expected_out_1: |-
    Semantic error ESE0127: No matching call signature for search(Object)
    Semantic error ESE0046: Type 'Object' is not compatible with type 'String|RegExp' at index 1
---*/

function main(): void {
    let obj: Object = {};
    let r: int = 'ABBABAB'.search(obj);
}
