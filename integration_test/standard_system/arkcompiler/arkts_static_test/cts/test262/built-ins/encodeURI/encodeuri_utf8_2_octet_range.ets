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

// arktsid: encodeuri_utf8_2_octet_range
// description: encodeURI correctly encodes 2-octet UTF-8 characters in [0x0080-0x07FF] (representative samples)

function main(): void {
    // 0x00A9 (copyright sign) -> 0xC2 0xA9
    arktest.assertEQ(encodeURI('©'), '%C2%A9', 'copyright sign');
    // 0x00E9 (e acute) -> 0xC3 0xA9
    arktest.assertEQ(encodeURI('é'), '%C3%A9', 'e acute');
    // 0x0100 (Latin A with macron)
    arktest.assertEQ(encodeURI('Ā'), '%C4%80', 'Latin A with macron');
    // 0x03A9 (Omega) -> 0xCE 0xA9
    arktest.assertEQ(encodeURI('Ω'), '%CE%A9', 'Omega');
    // 0x07FF (last of range) -> 0xDF 0xBF
    arktest.assertEQ(encodeURI('߿'), '%DF%BF', 'last char of 2-octet range');
}