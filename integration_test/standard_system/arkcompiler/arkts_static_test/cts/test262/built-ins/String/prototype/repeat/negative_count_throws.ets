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

// arktsid: repeat_negative_count_throws
// description: String.prototype.repeat throws RangeError for negative count
// Conversion notes: test262 also tests repeat(-Infinity); ArkTS int param
//   rejects -Infinity at compile time, so only -1 is tested here.

function main(): void {
    let caught: boolean = false;
    try {
        let s = ''.repeat(-1);
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'repeat(-1) should throw RangeError');
}