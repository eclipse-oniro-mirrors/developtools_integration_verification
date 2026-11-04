/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

// arktsid: numeric_separator_decimal_repeated_digits
// description: NonZeroDigit NumericLiteralSeparator DecimalDigit cases

function main(): void {


    arktest.assertEQ(1_0, 10);
    arktest.assertEQ(1_1, 11);
    arktest.assertEQ(2_2, 22);
    arktest.assertEQ(3_3, 33);
    arktest.assertEQ(4_4, 44);
    arktest.assertEQ(5_5, 55);
    arktest.assertEQ(6_6, 66);
    arktest.assertEQ(7_7, 77);
    arktest.assertEQ(8_8, 88);
    arktest.assertEQ(9_9, 99);



}