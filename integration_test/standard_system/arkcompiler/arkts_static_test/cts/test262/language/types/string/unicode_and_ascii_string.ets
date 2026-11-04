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

// arktsid: unicode_and_ascii_string
// description: Unicode escapes and ASCII characters can be combined in strings

function main(): void {
    let mixed: String = '\u0041A\u0042B\u0043C';
    arktest.assertEQ(mixed, 'AABBCC', 'mixed Unicode and ASCII string');

    let escapedPrefix: String = '\u0041\u0042\u0043' + 'ABC';
    arktest.assertEQ(escapedPrefix, 'ABCABC', 'escaped prefix concatenation');

    let escapedSuffix: String = 'ABC' + '\u0041\u0042\u0043';
    arktest.assertEQ(escapedSuffix, 'ABCABC', 'escaped suffix concatenation');
}
