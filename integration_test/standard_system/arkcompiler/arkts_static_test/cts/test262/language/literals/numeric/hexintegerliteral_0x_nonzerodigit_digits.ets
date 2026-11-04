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

// arktsid: hexintegerliteral_0x_nonzerodigit_digits
// description: HexIntegerLiteral :: 0x NonZeroDigit Digits

function main(): void {
    arktest.assertEQ(0x0, 0, '#0: 0x0 === 0');
    arktest.assertEQ(0x1, 1, '#1: 0x1 === 1');
    arktest.assertEQ(0x10, 16, '#2: 0x10 === 16');
    arktest.assertEQ(0x100, 256, '3: 0x100 === 256');
    arktest.assertEQ(0x1000, 4096, '#4: 0x1000 === 4096');
    arktest.assertEQ(0x10000, 65536, '#5: 0x10000 === 65536');
    arktest.assertEQ(0x100000, 1048576, '#6: 0x100000 === 1048576');
    arktest.assertEQ(0x1000000, 16777216, '#7: 0x1000000 === 16777216');
    arktest.assertEQ(0x10000000, 268435456, '#8: 0x10000000 === 268435456');
}
