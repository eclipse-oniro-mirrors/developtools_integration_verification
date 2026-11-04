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

// arktsid: decimalintegerliteral_nonzerodigit_decimaldigits
// description: DecimalIntegerLiteral :: NoNZeroDigit DecimalDigits

function main(): void {
    arktest.assertEQ(11, 11, '#1: 11 === 11');
    arktest.assertEQ(22, 22, '#2: 22 === 22');
    arktest.assertEQ(33, 33, '#3: 33 === 33');
    arktest.assertEQ(44, 44, '#4: 44 === 44');
    arktest.assertEQ(55, 55, '#5: 55 === 55');
    arktest.assertEQ(66, 66, '#6: 66 === 66');
    arktest.assertEQ(77, 77, '#7: 77 === 77');
    arktest.assertEQ(88, 88, '#8: 88 === 88');
    arktest.assertEQ(99, 99, '#9: 99 === 99');
}
