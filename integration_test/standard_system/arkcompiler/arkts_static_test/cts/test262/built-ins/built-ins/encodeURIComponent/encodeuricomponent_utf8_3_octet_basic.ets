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
// arktsid: encodeuricomponent_utf8_3_octet_basic
// description: encodeURIComponent 3-octet UTF-8 encoding for characters in [0x0800, 0xD7FF]

function main(): void {
    // Lower boundary character 0x0800 -> UTF-8 %E0%A0%80
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0x0800)), '%E0%A0%80',
        'Lower boundary 0x0800 encodes to %E0%A0%80');

    // Representative character 0x20AC (EURO SIGN) -> UTF-8 %E2%82%AC
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0x20AC)), '%E2%82%AC',
        'EURO SIGN encodes to %E2%82%AC');

    // Upper boundary character 0xD7FF -> UTF-8 %ED%9F%BF
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(0xD7FF)), '%ED%9F%BF',
        'Upper boundary 0xD7FF encodes to %ED%9F%BF');
}