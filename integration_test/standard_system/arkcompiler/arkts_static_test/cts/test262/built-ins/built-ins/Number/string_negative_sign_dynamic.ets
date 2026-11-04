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
// arktsid: number_string_negative_sign_dynamic
// description: Compare Number('-' + 'any_number') with -Number('any_number')

function main(): void {
    arktest.assertNegativeZero(Number(('-' + '0')), 'Number(dynaString("-", "0")) must return -Number("0")');
    arktest.assertEQ(Number(('-Infi' + 'nity')), -Infinity, '');
    arktest.assertEQ(Number(('-12345' + '67890')), -1234567890, '');
    arktest.assertEQ(Number(('-1234.' + '5678')), -1234.5678, '');
    arktest.assertEQ(Number(('-1234.' + '5678e90')), -1234.5678e90, '');
    arktest.assertEQ(Number(('-1234.' + '5678E90')), -1234.5678E90, '');
    arktest.assertEQ(Number(('-1234.' + '5678e-90')), -1234.5678e-90, '');
    arktest.assertEQ(Number(('-1234.' + '5678E-90')), -1234.5678E-90, '');
    arktest.assertEQ(Number(('-Infi' + 'nity')), Number.NEGATIVE_INFINITY, '');
}