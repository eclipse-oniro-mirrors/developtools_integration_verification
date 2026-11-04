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

// arktsid: non_escape_small_alphabet_code_units
// description: Small non-escape sequences produce their corresponding code units

function main(): void {
    let codes: int[] = [ 0x61, 0x63, 0x64, 0x65, 0x67, 0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D, 0x6F, 0x70, 0x71, 0x73, 0x77,
        0x79, 0x7A];
    let escaped: string[] = [ '\a', '\c', '\d', '\e', '\g', '\h', '\i', '\j', '\k', '\l', '\m', '\o', '\p', '\q', '\s',
        '\w', '\y', '\z'];
    for (let index: int = 0; index < codes.length; index++) {
        arktest.assertEQ(String.fromCharCode(codes[index]), escaped[index], 'small non-escape sequence');
    }
}