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

// arktsid: form_not_valid_throws
// description: String.prototype.normalize throws RangeError for invalid form

function main(): void {
    let caughtBar: boolean = false;
    try {
        let s = 'foo'.normalize('bar');
    } catch (e) {
        caughtBar = true;
    }
    arktest.assertTrue(caughtBar, 'normalize(\'bar\') should throw RangeError');

    let caughtNFC1: boolean = false;
    try {
        let s = 'foo'.normalize('NFC1');
    } catch (e) {
        caughtNFC1 = true;
    }
    arktest.assertTrue(caughtNFC1, 'normalize(\'NFC1\') should throw RangeError');
}