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

// arktsid: decodeuricomponent_utf8_4_octet
// description: decodeURIComponent correctly decodes 4-byte UTF-8 percent-encoded sequences (0xF0-0xF4 B1)

function main(): void {
    // 4-byte UTF-8: B1=11110xxx(0xF0-0xF4), B2,B3,B4=10xxxxxx(0x80-0xBF)
    // Decodes to codepoints U+10000 to U+10FFFF (represented as surrogate pairs in UTF-16)

    // %F0%90%80%80 decodes to U+10000 (LINEAR B SYLLABLE B008 A)
    // Surrogate pair: H = ((0x10000-0x10000)>>10)&0x3FF + 0xD800 = 0xD800
    //                L = (0x10000-0x10000)&0x3FF + 0xDC00 = 0xDC00
    let u10000: string = decodeURIComponent('%F0%90%80%80');
    arktest.assertEQ(u10000.length, 2, 'U+10000 is surrogate pair (length 2)');
    arktest.assertEQ(u10000.charCodeAt(0), 0xD800, 'U+10000 high surrogate is 0xD800');
    arktest.assertEQ(u10000.charCodeAt(1), 0xDC00, 'U+10000 low surrogate is 0xDC00');

    // %F0%90%8C%80 decodes to U+10300 (OLD ITALIC LETTER A)
    let u10300: string = decodeURIComponent('%F0%90%8C%80');
    arktest.assertEQ(u10300.length, 2, 'U+10300 is surrogate pair (length 2)');
    arktest.assertEQ(u10300.charCodeAt(0), 0xD800, 'U+10300 high surrogate is 0xD800');
    arktest.assertEQ(u10300.charCodeAt(1), 0xDF00, 'U+10300 low surrogate is 0xDF00');

    // %F4%8F%BF%BF decodes to U+10FFFF (highest valid codepoint)
    let u10FFFF: string = decodeURIComponent('%F4%8F%BF%BF');
    arktest.assertEQ(u10FFFF.length, 2, 'U+10FFFF is surrogate pair (length 2)');
    arktest.assertEQ(u10FFFF.charCodeAt(0), 0xDBFF, 'U+10FFFF high surrogate is 0xDBFF');
    arktest.assertEQ(u10FFFF.charCodeAt(1), 0xDFFF, 'U+10FFFF low surrogate is 0xDFFF');
}