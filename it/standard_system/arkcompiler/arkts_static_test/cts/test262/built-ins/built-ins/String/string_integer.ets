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

// arktsid: string_integer
// description: If 1 <= s < 1e21 or -1e21 < s < -1, return the string consisting of the k digits of the decimal
// representation of s (in order, with no leading zeroes), followed by n-k occurrences of the character '0'
// Conversion notes: integer literal 100000000000000000000 exceeds ArkTS long range (ESY0249),
//   replaced by the numerically identical double literal 1e20 (JS numbers are doubles).

function main(): void {
    arktest.assertEQ(String(1), '1', '#1: String(1) === \'1\'');
    arktest.assertEQ(String(10), '10', '#2: String(10) === \'10\'');
    arktest.assertEQ(String(100), '100', '#3: String(100) === \'100\'');
    arktest.assertEQ(String(1e20), '100000000000000000000', '#4: String(1e20) === \'100000000000000000000\'');
    arktest.assertEQ(String(1e20), '100000000000000000000', '#5: String(1e20) === \'100000000000000000000\'');
    arktest.assertEQ(String(12345), '12345', '#6: String(12345) === \'12345\'');
    arktest.assertEQ(String(12345000), '12345000', '#7: String(12345000) === \'12345000\'');
    arktest.assertEQ(String(-1), '-1', '#8: String(-1) === \'-1\'');
    arktest.assertEQ(String(-10), '-10', '#9: String(-10) === \'-10\'');
    arktest.assertEQ(String(-100), '-100', '#10: String(-100) === \'-100\'');
    arktest.assertEQ(String(-1e20), '-100000000000000000000', '#11: String(-1e20) === \'-100000000000000000000\'');
    arktest.assertEQ(String(-1e20), '-100000000000000000000', '#12: String(-1e20) === \'-100000000000000000000\'');
    arktest.assertEQ(String(-12345), '-12345', '#13: String(-12345) === \'-12345\'');
    arktest.assertEQ(String(-12345000), '-12345000', '#14: String(-12345000) === \'-12345000\'');
    arktest.assertEQ(String(1E20), '100000000000000000000', '#15: String(1E20) === \'100000000000000000000\'');
    arktest.assertEQ(String(-1E20), '-100000000000000000000', '#16: String(-1E20) === \'-100000000000000000000\'');
}