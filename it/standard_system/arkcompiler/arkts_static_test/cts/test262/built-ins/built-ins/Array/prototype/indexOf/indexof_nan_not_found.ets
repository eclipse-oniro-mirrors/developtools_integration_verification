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

// arktsid: indexof_nan_not_found
// description: Array.prototype.indexOf - search element is NaN
// Conversion notes:
//  - Source [+NaN, NaN, -NaN] are all the same NaN value; written as Double.NaN. indexOf uses
//    strict equality (===), and NaN !== NaN, so it returns -1.

function main(): void {
    let x: number[] = [Double.NaN, Double.NaN, Double.NaN];
    arktest.assertEQ(x.indexOf(Double.NaN), -1, '[+NaN, NaN, -NaN].indexOf(NaN)');
}