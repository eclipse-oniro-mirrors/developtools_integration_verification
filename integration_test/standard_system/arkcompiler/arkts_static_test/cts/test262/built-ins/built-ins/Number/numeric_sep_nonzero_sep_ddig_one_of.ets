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
// arktsid: number_numeric_sep_nonzero_sep_ddig_one_of
// description: NumericLiteralSeparator is not valid on string conversions for ToNumber operations

function main(): void {
    arktest.assertTrue(isNaN(Number('1_0')), '1_0');
    arktest.assertTrue(isNaN(Number('1_1')), '1_1');
    arktest.assertTrue(isNaN(Number('2_2')), '2_2');
    arktest.assertTrue(isNaN(Number('3_3')), '3_3');
    arktest.assertTrue(isNaN(Number('4_4')), '4_4');
    arktest.assertTrue(isNaN(Number('5_5')), '5_5');
    arktest.assertTrue(isNaN(Number('6_6')), '6_6');
    arktest.assertTrue(isNaN(Number('7_7')), '7_7');
    arktest.assertTrue(isNaN(Number('8_8')), '8_8');
    arktest.assertTrue(isNaN(Number('9_9')), '9_9');
}