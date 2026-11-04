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

// arktsid: numeric_separator_decimal_integer_digit
// description: NonZeroDigit NumericLiteralSeparator DecimalDigit

function main(): void {
    arktest.assertEQ(1_0, 10);
    arktest.assertEQ(1_1, 11);
    arktest.assertEQ(1_2, 12);
    arktest.assertEQ(1_3, 13);
    arktest.assertEQ(1_4, 14);
    arktest.assertEQ(1_5, 15);
    arktest.assertEQ(1_6, 16);
    arktest.assertEQ(1_7, 17);
    arktest.assertEQ(1_8, 18);
    arktest.assertEQ(1_9, 19);
}
