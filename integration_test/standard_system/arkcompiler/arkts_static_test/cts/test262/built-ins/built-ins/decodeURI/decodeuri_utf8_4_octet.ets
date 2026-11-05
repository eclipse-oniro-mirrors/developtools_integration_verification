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

// arktsid: decodeuri_utf8_4_octet
// description: decodeURI correctly decodes 4-byte UTF-8 sequences (U+10000 to U+10FFFF)

function main(): void {
    // Representative 4-byte UTF-8 percent-encoded sequences (supplementary characters)
    // U+10000: LINEAR B SYLLABLE B008 A → encoded from a surrogate pair
    arktest.assertEQ(decodeURI('%F0%90%80%80'), '𐀀', '4-byte UTF-8: %F0%90%80%80 should decode to U+10000');
    // U+10348: GOTHIC LETTER HWAIR → encoded from a surrogate pair
    arktest.assertEQ(decodeURI('%F0%90%8D%88'), '𐍈', '4-byte UTF-8: %F0%90%8D%88 should decode to U+10348');
    // U+1F600: GRINNING FACE 😀 → encoded from a surrogate pair
    arktest.assertEQ(decodeURI('%F0%9F%98%80'), '😀', '4-byte UTF-8: %F0%9F%98%80 should decode to U+1F600');
    // U+10FFFF: max Unicode codepoint → encoded from a surrogate pair
    arktest.assertEQ(decodeURI('%F4%8F%BF%BF'), '􏿿', '4-byte UTF-8: %F4%8F%BF%BF should decode to U+10FFFF');
}