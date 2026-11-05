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

// arktsid: numeric_literal_tostring_radix_1
// description: Number.prototype.toString throws RangeError for radix 1 (below 2)
// Conversion notes: test262 expects RangeError; ArkTS throws ArgumentOutOfRangeError.

function main(): void {
    let caught0: boolean = false;
    try {
        let s = (0).toString(1);
    } catch (e) {
        caught0 = true;
    }
    arktest.assertTrue(caught0, '0.toString(1) should throw');

    let caught1: boolean = false;
    try {
        let s = (1).toString(1);
    } catch (e) {
        caught1 = true;
    }
    arktest.assertTrue(caught1, '1.toString(1) should throw');
}