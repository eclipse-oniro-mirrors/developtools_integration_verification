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
// arktsid: number_numeric_sep_ddigs_sep_ddig
// description: DecimalDigits NumericLiteralSeparator DecimalDigit

function main(): void {
    arktest.assertTrue(isNaN(Number('123456789_0')), '123456789_0');
    arktest.assertTrue(isNaN(Number('123456789_1')), '123456789_1');
    arktest.assertTrue(isNaN(Number('123456789_2')), '123456789_2');
    arktest.assertTrue(isNaN(Number('123456789_3')), '123456789_3');
    arktest.assertTrue(isNaN(Number('123456789_4')), '123456789_4');
    arktest.assertTrue(isNaN(Number('123456789_5')), '123456789_5');
    arktest.assertTrue(isNaN(Number('123456789_6')), '123456789_6');
    arktest.assertTrue(isNaN(Number('123456789_7')), '123456789_7');
    arktest.assertTrue(isNaN(Number('123456789_8')), '123456789_8');
    arktest.assertTrue(isNaN(Number('123456789_9')), '123456789_9');
}