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
// arktsid: number_string_signed_decimal
// description: Compare Number('-[or +]any_number') with -[or without -]any_number)

function main(): void {
    arktest.assertEQ(Number('1'), 1, 'Number("1") must return 1');
    arktest.assertEQ(Number('+1'), 1, 'Number("+1") must return 1');
    arktest.assertEQ(Number('-1'), -1, 'Number("-1") must return -1');
    arktest.assertEQ(Number('2'), 2, 'Number("2") must return 2');
    arktest.assertEQ(Number('+2'), 2, 'Number("+2") must return 2');
    arktest.assertEQ(Number('-2'), -2, 'Number("-2") must return -2');
    arktest.assertEQ(Number('3'), 3, 'Number("3") must return 3');
    arktest.assertEQ(Number('+3'), 3, 'Number("+3") must return 3');
    arktest.assertEQ(Number('-3'), -3, 'Number("-3") must return -3');
    arktest.assertEQ(Number('4'), 4, 'Number("4") must return 4');
    arktest.assertEQ(Number('+4'), 4, 'Number("+4") must return 4');
    arktest.assertEQ(Number('-4'), -4, 'Number("-4") must return -4');
    arktest.assertEQ(Number('5'), 5, 'Number("5") must return 5');
    arktest.assertEQ(Number('+5'), 5, 'Number("+5") must return 5');
    arktest.assertEQ(Number('-5'), -5, 'Number("-5") must return -5');
    arktest.assertEQ(Number('6'), 6, 'Number("6") must return 6');
    arktest.assertEQ(Number('+6'), 6, 'Number("+6") must return 6');
    arktest.assertEQ(Number('-6'), -6, 'Number("-6") must return -6');
    arktest.assertEQ(Number('7'), 7, 'Number("7") must return 7');
    arktest.assertEQ(Number('+7'), 7, 'Number("+7") must return 7');
    arktest.assertEQ(Number('-7'), -7, 'Number("-7") must return -7');
    arktest.assertEQ(Number('8'), 8, 'Number("8") must return 8');
    arktest.assertEQ(Number('+8'), 8, 'Number("+8") must return 8');
    arktest.assertEQ(Number('-8'), -8, 'Number("-8") must return -8');
    arktest.assertEQ(Number('9'), 9, 'Number("9") must return 9');
    arktest.assertEQ(Number('+9'), 9, 'Number("+9") must return 9');
    arktest.assertEQ(Number('-9'), -9, 'Number("-9") must return -9');
}