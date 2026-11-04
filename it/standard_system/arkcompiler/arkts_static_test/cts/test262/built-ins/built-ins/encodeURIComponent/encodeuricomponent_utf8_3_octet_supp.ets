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
// arktsid: encodeuricomponent_utf8_3_octet_supp
// description: encodeURIComponent 3-octet UTF-8 encoding for characters in [0xE000, 0xFFFF]

function main(): void {
    // Lower boundary character 0xE000 -> UTF-8 %EE%80%80
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0xE000)), '%EE%80%80',
        'Lower boundary 0xE000 encodes to %EE%80%80');

    // Representative character 0x4E2D (CHINESE CHARACTER ZHONG) -> UTF-8 %E4%B8%AD
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0x4E2D)), '%E4%B8%AD',
        'CJK character U+4E2D encodes to %E4%B8%AD');

    // Upper boundary character 0xFFFF -> UTF-8 %EF%BF%BF
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0xFFFF)), '%EF%BF%BF',
        'Upper boundary 0xFFFF encodes to %EF%BF%BF');
}