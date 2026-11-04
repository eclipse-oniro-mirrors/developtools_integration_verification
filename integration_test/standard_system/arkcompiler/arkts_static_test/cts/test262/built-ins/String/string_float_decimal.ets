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

// arktsid: string_float_decimal
// description: Return the string consisting of the most significant digit of the decimal representation of s, followed
// by a decimal point '.', followed by the remaining k-1 digits, followed by the lowercase character 'e' and a sign when
// the exponent form is used

function main(): void {
    arktest.assertEQ(String(1.2345), '1.2345', '#1: String(1.2345) === \'1.2345\'');
    arktest.assertEQ(String(1.234567890), '1.23456789', '#2: String(1.234567890) === \'1.23456789\'');
    arktest.assertEQ(String(0.12345), '0.12345', '#3: String(0.12345) === \'0.12345\'');
    arktest.assertEQ(String(0.012345), '0.012345', '#4: String(0.012345) === \'0.012345\'');
    arktest.assertEQ(String(0.0012345), '0.0012345', '#5: String(0.0012345) === \'0.0012345\'');
    arktest.assertEQ(String(0.00012345), '0.00012345', '#6: String(0.00012345) === \'0.00012345\'');
    arktest.assertEQ(String(0.000012345), '0.000012345', '#7: String(0.000012345) === \'0.000012345\'');
    arktest.assertEQ(String(0.0000012345), '0.0000012345', '#8: String(0.0000012345) === \'0.0000012345\'');
    arktest.assertEQ(String(0.00000012345), '1.2345e-7', '#9: String(0.00000012345) === \'1.2345e-7\'');
}