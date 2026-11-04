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
// arktsid: string_return_string_value
// description: Returns the String value whose elements are, in order, the code unit for the numbers in the arguments
// list.

function main(): void {
    arktest.assertEQ(String.fromCodePoint(0), '\x00', '');
    arktest.assertEQ(String.fromCodePoint(42), '*', '');
    arktest.assertEQ(String.fromCodePoint(65, 90), 'AZ', '');
    arktest.assertEQ(String.fromCodePoint(0x404), '\u0404', '');
    arktest.assertEQ(String.fromCodePoint(0x2F804), '\uD87E\uDC04', '');
    arktest.assertEQ(String.fromCodePoint(194564), '\uD87E\uDC04', '');
    arktest.assertEQ(String.fromCodePoint(0x1D306, 0x61, 0x1D307), '\uD834\uDF06a\uD834\uDF07', '');
    arktest.assertEQ(String.fromCodePoint(1114111), '\uDBFF\uDFFF', '');
}