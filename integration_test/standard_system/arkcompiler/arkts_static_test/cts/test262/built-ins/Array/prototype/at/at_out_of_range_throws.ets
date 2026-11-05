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

// arktsid: at_out_of_range_throws
// description: Array.prototype.at throws RangeError for out-of-range index
// Conversion notes: test262 expects undefined for out-of-range at(); ArkTS at()
//   throws RangeError instead — behavior difference captured as positive throw test.

function main(): void {
    let a: int[] = [];

    // Out-of-range indices throw RangeError in ArkTS
    let caught0: boolean = false;
    try {
        let x = a.at(0);
    } catch (e) {
        caught0 = true;
    }
    arktest.assertTrue(caught0, 'a.at(0) on empty array should throw');

    let caught1: boolean = false;
    try {
        let x = a.at(1);
    } catch (e) {
        caught1 = true;
    }
    arktest.assertTrue(caught1, 'a.at(1) on empty array should throw');

    let caughtNeg: boolean = false;
    try {
        let x = a.at(-2);
    } catch (e) {
        caughtNeg = true;
    }
    arktest.assertTrue(caughtNeg, 'a.at(-2) on empty array should throw');
}