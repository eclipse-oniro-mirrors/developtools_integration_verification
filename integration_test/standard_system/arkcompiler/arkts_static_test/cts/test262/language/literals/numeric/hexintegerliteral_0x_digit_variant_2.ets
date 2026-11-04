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

// arktsid: hexintegerliteral_0x_digit_variant_2
// description: HexIntegerLiteral :: 0X Digit

function main(): void {
    arktest.assertEQ(0X0, 0, '#0: 0X0 === 0');
    arktest.assertEQ(0X1, 1, '#1: 0X1 === 1');
    arktest.assertEQ(0X2, 2, '#2: 0X2 === 2');
    arktest.assertEQ(0X3, 3, '#3: 0X3 === 3');
    arktest.assertEQ(0X4, 4, '#4: 0X4 === 4');
    arktest.assertEQ(0X5, 5, '#5: 0X5 === 5');
    arktest.assertEQ(0X6, 6, '#6: 0X6 === 6');
    arktest.assertEQ(0X7, 7, '#7: 0X7 === 7');
    arktest.assertEQ(0X8, 8, '#8: 0X8 === 8');
    arktest.assertEQ(0X9, 9, '#9: 0X9 === 9');
    arktest.assertEQ(0XA, 10, '#A: 0XA === 10');
    arktest.assertEQ(0XB, 11, '#B: 0XB === 11');
    arktest.assertEQ(0XC, 12, '#C: 0XC === 12');
    arktest.assertEQ(0XD, 13, '#D: 0XD === 13');
    arktest.assertEQ(0XE, 14, '#E: 0XE === 14');
    arktest.assertEQ(0XF, 15, '#F: 0XF === 15');
}
