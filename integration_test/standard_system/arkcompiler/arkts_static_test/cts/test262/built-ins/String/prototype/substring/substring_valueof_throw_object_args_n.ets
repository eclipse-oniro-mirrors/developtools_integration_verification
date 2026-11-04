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
// arktsid: substring_valueof_throw_object_args_n
// description: String.prototype.substring with Object start/end arguments is rejected at compile time (valueOf
// throws in test262)
// description: String.prototype.substring with Object start/end arguments is rejected at compile time (valueOf
// throws in test262)
// Conversion notes: test262 both args valueOf throw ("instart"); ArkTS substring takes Int args, Object is not
// compatible
// Conversion notes: test262 both args valueOf throw ("instart"); ArkTS substring takes Int args, Object is not
// compatible

/*---
desc: String.prototype.substring with Object start/end arguments is rejected at compile time (valueOf throws in test262)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for substring(Object, Object)",
    "Semantic error ESE0046: Type 'Object' is not compatible with type 'Int' at index 1",
]
---*/

function main(): void {
    let s: string = 'ABBABABAB';
    let start: Object = {};
    let end: Object = {};
    s.substring(start, end);
}
