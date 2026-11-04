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

// arktsid: decodeuricomponent_utf8_3_octet
// description: decodeURIComponent correctly decodes 3-byte UTF-8 percent-encoded sequences (0xE0-0xEF B1, excluding
// surrogates)

function main(): void {
    // 3-byte UTF-8: B1=1110xxxx(0xE0-0xEF), B2,B3=10xxxxxx(0x80-0xBF)
    // Decodes to codepoints U+0800 to U+FFFF (excluding the surrogate range)
    arktest.assertEQ(decodeURIComponent('%E0%A0%80'), 'ࠀ', '%E0%A0%80 decodes to U+0800');
    arktest.assertEQ(decodeURIComponent('%E2%82%AC'), '€', '%E2%82%AC decodes to euro sign (U+20AC)');
    arktest.assertEQ(decodeURIComponent('%E4%B8%AD'), '中', '%E4%B8%AD decodes to 中 (U+4E2D)');
    arktest.assertEQ(decodeURIComponent('%E8%B0%A2'), '谢', '%E8%B0%A2 decodes to U+8C22');
    arktest.assertEQ(decodeURIComponent('%EF%BF%BF'), '￿', '%EF%BF%BF decodes to U+FFFF');

    // Boundary: highest non-surrogate (B1=0xEF, B2=0xBF, B3=0xBF => U+FFFF)
    arktest.assertEQ(decodeURIComponent('%EF%BF%BF'), '￿', '%EF%BF%BF decodes to U+FFFF');
}