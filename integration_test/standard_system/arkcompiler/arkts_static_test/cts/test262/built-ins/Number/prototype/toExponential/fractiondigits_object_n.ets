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
// arktsid: number_toexponential_fractiondigits_object_n
// description: Number.prototype.toExponential with an object fractionDigits is rejected at compile time (no object
// ToInteger coercion)
// description: Number.prototype.toExponential with an object fractionDigits is rejected at compile time (no object
// ToInteger coercion)
// Conversion notes: test262 ToInteger(fractionDigits) coerces an object (valueOf/toString) and throws on abrupt
// completion; ArkTS requires a numeric argument and rejects objects at compile time
// Conversion notes: test262 ToInteger(fractionDigits) coerces an object (valueOf/toString) and throws on abrupt
// completion; ArkTS requires a numeric argument and rejects objects at compile time

/*---
desc: |
    Number.prototype.toExponential with an object fractionDigits is rejected at compile time (no object ToInteger
    coercion)
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0127: No matching call signature for toExponential(Object)",
    "Semantic error ESE0046: Type 'Object' is not compatible with type 'Double|undefined' at index 1",
]
---*/

function main(): void {
    let fd: Object = {};
    NaN.toExponential(fd);
}
