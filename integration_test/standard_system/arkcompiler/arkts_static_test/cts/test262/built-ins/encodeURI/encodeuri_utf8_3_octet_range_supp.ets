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

// arktsid: encodeuri_utf8_3_octet_range_supp
// description: encodeURI correctly encodes 3-octet UTF-8 characters in [0xE000-0xFFFF] (representative samples)

function main(): void {
    // 0xE000 (first of range) -> EE 80 80
    arktest.assertEQ(encodeURI(''), '%EE%80%80', 'first char of 3-octet supplementary range');
    // 0xF8FF (private use) -> EF A3 BF
    arktest.assertEQ(encodeURI(''), '%EF%A3%BF', 'private use char F8FF');
    // 0xFFFF (last of range) -> EF BF BF
    arktest.assertEQ(encodeURI('￿'), '%EF%BF%BF', 'last char U+FFFF');
}