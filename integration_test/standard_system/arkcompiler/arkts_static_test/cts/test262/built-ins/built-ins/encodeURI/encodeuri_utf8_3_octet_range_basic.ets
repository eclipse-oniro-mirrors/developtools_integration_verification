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

// arktsid: encodeuri_utf8_3_octet_range_basic
// description: encodeURI correctly encodes 3-octet UTF-8 characters in [0x0800-0xD7FF] (representative samples)

function main(): void {
    // 0x0800 (first of range) -> 0xE0 0xA0 0x80
    arktest.assertEQ(encodeURI('ࠀ'), '%E0%A0%80', 'first char of 3-octet basic range');
    // 0x0905 (Devanagari letter A)
    arktest.assertEQ(encodeURI('अ'), '%E0%A4%85', 'Devanagari letter A');
    // 0x4E2D (CJK ideograph)
    arktest.assertEQ(encodeURI('中'), '%E4%B8%AD', 'CJK ideograph');
    // 0xD7FF (last of range)
    arktest.assertEQ(encodeURI('퟿'), '%ED%9F%BF', 'last char of 3-octet basic range');
}