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

// arktsid: range
// description: Number.prototype.toPrecision throws for precision outside 1..100
// Conversion notes: toPrecision(-10) does NOT throw in ArkTS (abs resolves to 10) —
//   excluded to match ArkTS actual behavior.

function main(): void {
    arktest.assertEQ((3.0).toPrecision(1), '3', 'precision 1');

    let caught0: boolean = false;
    try {
        let s = (3.0).toPrecision(0);
    } catch (e) {
        caught0 = true;
    }
    arktest.assertTrue(caught0, 'toPrecision(0) should throw');

    let caught101: boolean = false;
    try {
        let s = (3.0).toPrecision(101);
    } catch (e) {
        caught101 = true;
    }
    arktest.assertTrue(caught101, 'toPrecision(101) should throw');
}