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

// arktsid: hexintegerliteral_0x_digit
// description: HexIntegerLiteral :: 0x Digit

function main(): void {
    arktest.assertEQ(0x0, 0, '#0: 0x0 === 0');
    arktest.assertEQ(0x1, 1, '#1: 0x1 === 1');
    arktest.assertEQ(0x2, 2, '#2: 0x2 === 2');
    arktest.assertEQ(0x3, 3, '#3: 0x3 === 3');
    arktest.assertEQ(0x4, 4, '#4: 0x4 === 4');
    arktest.assertEQ(0x5, 5, '#5: 0x5 === 5');
    arktest.assertEQ(0x6, 6, '#6: 0x6 === 6');
    arktest.assertEQ(0x7, 7, '#7: 0x7 === 7');
    arktest.assertEQ(0x8, 8, '#8: 0x8 === 8');
    arktest.assertEQ(0x9, 9, '#9: 0x9 === 9');
    arktest.assertEQ(0xA, 10, '#A: 0xA === 10');
    arktest.assertEQ(0xB, 11, '#B: 0xB === 11');
    arktest.assertEQ(0xC, 12, '#C: 0xC === 12');
    arktest.assertEQ(0xD, 13, '#D: 0xD === 13');
    arktest.assertEQ(0xE, 14, '#E: 0xE === 14');
    arktest.assertEQ(0xF, 15, '#F: 0xF === 15');
}
