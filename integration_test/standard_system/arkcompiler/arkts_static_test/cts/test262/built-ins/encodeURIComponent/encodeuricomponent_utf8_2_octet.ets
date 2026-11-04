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
// arktsid: encodeuricomponent_utf8_2_octet
// description: encodeURIComponent 2-octet UTF-8 encoding for characters in [0x0080, 0x07FF]

function main(): void {
    // Representative character 0x00A2 (CENT SIGN) -> UTF-8 %C2%A2
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0x00A2)), '%C2%A2',
        'CENT SIGN encodes to %C2%A2');

    // Representative character 0x0401 (CYRILLIC CAPITAL LETTER IO) -> UTF-8 %D0%81
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0x0401)), '%D0%81',
        'CYRILLIC CAPITAL LETTER IO encodes to %D0%81');

    // Boundary character 0x07FF -> UTF-8 %DF%BF
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0x07FF)), '%DF%BF',
        'Upper boundary 0x07FF encodes to %DF%BF');
}