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

// arktsid: string_small_float
// description: If 1 > s > -1, and -6 < n <= 0, return the string consisting of the character '0', followed by a decimal
// point '.', followed by -n occurrences of the character '0', followed by the k digits of the decimal representation of
// s

function main(): void {
    arktest.assertEQ(String(0.1), '0.1', '#1: String(0.1) === \'0.1\'');
    arktest.assertEQ(String(0.000001), '0.000001', '#2: String(0.000001) === \'0.000001\'');
    arktest.assertEQ(String(1e-6), '0.000001', '#3: String(1e-6) === \'0.000001\'');
    arktest.assertEQ(String(1E-6), '0.000001', '#4: String(1E-6) === \'0.000001\'');
    arktest.assertEQ(String(-0.1), '-0.1', '#5: String(-0.1) === \'-0.1\'');
    arktest.assertEQ(String(-0.000001), '-0.000001', '#6: String(-0.000001) === \'-0.000001\'');
    arktest.assertEQ(String(-1e-6), '-0.000001', '#7: String(-1e-6) === \'-0.000001\'');
    arktest.assertEQ(String(-1E-6), '-0.000001', '#8: String(-1E-6) === \'-0.000001\'');
}