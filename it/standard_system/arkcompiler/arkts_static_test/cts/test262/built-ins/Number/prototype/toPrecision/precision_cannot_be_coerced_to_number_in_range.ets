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

// arktsid: precision_cannot_be_coerced_to_number_in_range
// description: Number.prototype.toPrecision throws a RangeError if precision cannot be coerced to a number in range
// Conversion notes: function/object precision args (JS ToNumber coercion) are rejected
//   at compile time in ArkTS; only the NaN case is representable — NaN coerces to
//   ToInteger 0, which is outside 1..100 and throws.

function main(): void {
    let caughtNaN: boolean = false;
    try {
        let s = (1.0).toPrecision(NaN);
    } catch (e) {
        caughtNaN = true;
    }
    arktest.assertTrue(caughtNaN, 'toPrecision(NaN) should throw');
}