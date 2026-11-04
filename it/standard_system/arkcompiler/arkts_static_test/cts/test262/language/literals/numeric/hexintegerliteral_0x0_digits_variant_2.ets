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

// arktsid: hexintegerliteral_0x0_digits_variant_2
// description: HexIntegerLiteral :: 0X0 Digits

function main(): void {
    arktest.assertEQ(0X00, 0, '#0: 0X00 === 0');
    arktest.assertEQ(0X01, 1, '#1: 0X01 === 1');
    arktest.assertEQ(0X010, 16, '#2: 0X010 === 16');
    arktest.assertEQ(0X0100, 256, '3: 0X0100 === 256');
    arktest.assertEQ(0X01000, 4096, '#4: 0X01000 === 4096');
    arktest.assertEQ(0X010000, 65536, '#5: 0X010000 === 65536');
    arktest.assertEQ(0X0100000, 1048576, '#6: 0X0100000 === 1048576');
    arktest.assertEQ(0X01000000, 16777216, '#7: 0X01000000 === 16777216');
    arktest.assertEQ(0X010000000, 268435456, '#8: 0X010000000 === 268435456');
}
