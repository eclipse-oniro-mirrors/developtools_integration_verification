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

// arktsid: non_escape_capital_alphabet_code_units
// description: Capital non-escape sequences produce their corresponding code units

function main(): void {
    let codes: int[] = [ 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50,
        0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A];
    let escaped: string[] = [ '\A', '\B', '\C', '\D', '\E', '\F', '\G', '\H', '\I', '\J', '\K', '\L', '\M', '\N', '\O',
        '\P', '\Q', '\R', '\S', '\T', '\U', '\V', '\W', '\X', '\Y', '\Z'];
    for (let index: int = 0; index < codes.length; index++) {
        arktest.assertEQ(String.fromCharCode(codes[index]), escaped[index], 'capital non-escape sequence');
    }
}