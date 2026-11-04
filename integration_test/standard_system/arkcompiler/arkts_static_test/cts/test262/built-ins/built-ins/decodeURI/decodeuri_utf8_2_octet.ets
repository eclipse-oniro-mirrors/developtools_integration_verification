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

// arktsid: decodeuri_utf8_2_octet
// description: decodeURI correctly decodes 2-byte UTF-8 sequences (U+0080 to U+07FF)

function main(): void {
    // Representative 2-byte UTF-8 percent-encoded sequences
    arktest.assertEQ(decodeURI('%C2%80'), '', '2-byte UTF-8: %C2%80 should decode to U+0080');
    arktest.assertEQ(decodeURI('%C3%BF'), 'ÿ', '2-byte UTF-8: %C3%BF should decode to U+00FF');
        arktest.assertEQ(decodeURI('%D0%AE'), 'Ю',
        '2-byte UTF-8: %D0%AE should decode to U+042E (CYRILLIC CAPITAL LETTER YU)');
    arktest.assertEQ(decodeURI('%DF%BF'), '߿', '2-byte UTF-8: %DF%BF should decode to U+07FF');
    // Lower boundary of 2-byte range
    arktest.assertEQ(decodeURI('%C2%81'), '', '2-byte UTF-8: %C2%81 should decode to U+0081');
    // Upper boundary of 2-byte range
    arktest.assertEQ(decodeURI('%DF%80'), '߀', '2-byte UTF-8: %DF%80 should decode to U+07C0');
}