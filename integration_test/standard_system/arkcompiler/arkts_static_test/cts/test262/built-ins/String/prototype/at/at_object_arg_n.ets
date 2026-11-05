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
// arktsid: at_object_arg_n
// description: String.prototype.at with an object argument is rejected at compile time (method-arg-type)
// Conversion notes: test262 ToInteger(index) via valueOf — object coercion is not supported, object is not
// compatible with Int
// Conversion notes: test262 ToInteger(index) via valueOf — object coercion is not supported, object is not
// compatible with Int

/*---
desc: String.prototype.at with an object argument is rejected at compile time (method-arg-type)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for at(Object)",
    "Semantic error ESE0046: Type 'Object' is not compatible with type 'Int' at index 1",
]
---*/

function main(): void {
    let s: string = '01';
    let obj: Object = {};
    s.at(obj);
}
