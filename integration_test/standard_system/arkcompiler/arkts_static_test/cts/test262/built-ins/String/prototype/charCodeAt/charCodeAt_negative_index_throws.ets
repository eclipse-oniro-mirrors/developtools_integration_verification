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

// arktsid: charCodeAt_negative_index_throws
// description: String.prototype.charCodeAt throws RangeError for negative index
// Conversion notes: test262 expects NaN return for negative pos (via prototype
//   chain). ArkTS charCodeAt throws RangeError for index < 0, asserted via try-catch.

function main(): void {
    let caught: boolean = false;
    try {
        let c = 'abc'.charCodeAt(-1);
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'charCodeAt(-1) should throw RangeError');
}