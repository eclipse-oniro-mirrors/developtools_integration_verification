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
// arktsid: number_numeric_sep_ddig_sep_ddig_one_of
// description: NumericLiteralSeparator is not valid on string conversions for ToNumber operations

function main(): void {
    arktest.assertTrue(isNaN(Number('1_0')), '1_0');
    arktest.assertTrue(isNaN(Number('1_1')), '1_1');
    arktest.assertTrue(isNaN(Number('1_2')), '1_2');
    arktest.assertTrue(isNaN(Number('1_3')), '1_3');
    arktest.assertTrue(isNaN(Number('1_4')), '1_4');
    arktest.assertTrue(isNaN(Number('1_5')), '1_5');
    arktest.assertTrue(isNaN(Number('1_6')), '1_6');
    arktest.assertTrue(isNaN(Number('1_7')), '1_7');
    arktest.assertTrue(isNaN(Number('1_8')), '1_8');
    arktest.assertTrue(isNaN(Number('1_9')), '1_9');
}