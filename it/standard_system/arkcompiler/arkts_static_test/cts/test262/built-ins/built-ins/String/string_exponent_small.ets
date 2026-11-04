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

// arktsid: string_exponent_small
// description: Return the string consisting of the single digit of s, followed by lowercase character 'e', a sign and
// the decimal representation of abs(n-1) for small float numbers with many zeros

function main(): void {
    arktest.assertEQ(String(0.0000001), '1e-7', '#1: String(0.0000001) === \'1e-7\'');
    arktest.assertEQ(String(0.000000000100000000000), '1e-10', '#2: String(0.000000000100000000000) === \'1e-10\'');
    arktest.assertEQ(String(1e-7), '1e-7', '#3: String(1e-7) === \'1e-7\'');
    arktest.assertEQ(String(1.0e-10), '1e-10', '#4: String(1.0e-10) === \'1e-10\'');
    arktest.assertEQ(String(1E-7), '1e-7', '#5: String(1E-7) === \'1e-7\'');
    arktest.assertEQ(String(1.0E-10), '1e-10', '#6: String(1.0E-10) === \'1e-10\'');
    arktest.assertEQ(String(-0.0000001), '-1e-7', '#7: String(-0.0000001) === \'-1e-7\'');
    arktest.assertEQ(String(-0.000000000100000000000), '-1e-10', '#8: String(-0.000000000100000000000) === \'-1e-10\'');
    arktest.assertEQ(String(-1e-7), '-1e-7', '#9: String(-1e-7) === \'-1e-7\'');
    arktest.assertEQ(String(-1.0e-10), '-1e-10', '#10: String(-1.0e-10) === \'-1e-10\'');
    arktest.assertEQ(String(-1E-7), '-1e-7', '#11: String(-1E-7) === \'-1e-7\'');
    arktest.assertEQ(String(-1.0E-10), '-1e-10', '#12: String(-1.0E-10) === \'-1e-10\'');
}