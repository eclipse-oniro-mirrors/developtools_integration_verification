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

// arktsid: decodeuricomponent_utf8_2_octet
// description: decodeURIComponent correctly decodes 2-byte UTF-8 percent-encoded sequences (0xC2-0xDF B1, 0x80-0xBF B2)

function main(): void {
    // 2-byte UTF-8: B1=110xxxxx(0xC2-0xDF), B2=10xxxxxx(0x80-0xBF)
    // Decodes to codepoints U+0080 to U+07FF
    arktest.assertEQ(decodeURIComponent('%C2%A0'), ' ', '%C2%A0 decodes to non-breaking space');
    arktest.assertEQ(decodeURIComponent('%C2%A9'), '©', '%C2%A9 decodes to copyright sign');
    arktest.assertEQ(decodeURIComponent('%C2%B0'), '°', '%C2%B0 decodes to degree sign');
    arktest.assertEQ(decodeURIComponent('%C3%80'), 'À', '%C3%80 decodes to À (U+00C0)');
    arktest.assertEQ(decodeURIComponent('%C3%9F'), 'ß', '%C3%9F decodes to sharp s (U+00DF)');
    arktest.assertEQ(decodeURIComponent('%C3%BF'), 'ÿ', '%C3%BF decodes to ÿ (U+00FF)');
    arktest.assertEQ(decodeURIComponent('%D0%AE'), 'Ю', '%D0%AE decodes to Ю (U+042E)');
    arktest.assertEQ(decodeURIComponent('%DF%BF'), '߿', '%DF%BF decodes to U+07FF');

    // Boundary: lowest 2-byte sequence (B1=0xC2, B2=0x80 => U+0080)
    arktest.assertEQ(decodeURIComponent('%C2%80'), '', '%C2%80 decodes to U+0080');
}