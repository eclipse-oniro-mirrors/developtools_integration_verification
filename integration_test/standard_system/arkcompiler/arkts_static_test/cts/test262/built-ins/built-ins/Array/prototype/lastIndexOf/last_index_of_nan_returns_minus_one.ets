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

// arktsid: last_index_of_nan_returns_minus_one
// description: Array.prototype.lastIndexOf - search element is NaN
// Conversion notes:
// - Source array [+NaN, NaN, -NaN] all denote the same NaN value; expressed as Double.NaN. Message preserves the
// original notation.
//  - lastIndexOf uses strict equality (===); NaN !== NaN, so the result is -1.

function main(): void {
    let arr: number[] = [Double.NaN, Double.NaN, Double.NaN];
    arktest.assertEQ(arr.lastIndexOf(Double.NaN), -1, '[+NaN, NaN, -NaN].lastIndexOf(NaN)');
}