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

// arktsid: decodeuri_utf8_3_octet
// description: decodeURI correctly decodes 3-byte UTF-8 sequences (U+0800 to U+FFFF, excluding surrogates)

function main(): void {
    // Representative 3-byte UTF-8 percent-encoded sequences
    arktest.assertEQ(decodeURI('%E0%A0%80'), 'ࠀ', '3-byte UTF-8: %E0%A0%80 should decode to U+0800');
    arktest.assertEQ(decodeURI('%E1%80%80'), 'က', '3-byte UTF-8: %E1%80%80 should decode to U+1000');
        arktest.assertEQ(decodeURI('%E4%B8%80'), '一',
        '3-byte UTF-8: %E4%B8%80 should decode to U+4E00 (CJK UNIFIED IDEOGRAPH)');
    arktest.assertEQ(decodeURI('%EF%BF%BF'), '￿', '3-byte UTF-8: %EF%BF%BF should decode to U+FFFF');
    // E0 start range with valid B2 (>= 0xA0)
    arktest.assertEQ(decodeURI('%E0%A0%81'), 'ࠁ', '3-byte UTF-8: %E0%A0%81 should decode to U+0801');
    // ED range below surrogates (B2 < 0xA0)
        arktest.assertEQ(decodeURI('%ED%9F%BF'), '퟿',
        '3-byte UTF-8: %ED%9F%BF should decode to U+D7FF (last before surrogates)');
    // ED range above surrogates (B2 >= 0xB0)
        arktest.assertEQ(decodeURI('%EE%80%80'), '',
        '3-byte UTF-8: %EE%80%80 should decode to U+E000 (first after surrogates)');
}