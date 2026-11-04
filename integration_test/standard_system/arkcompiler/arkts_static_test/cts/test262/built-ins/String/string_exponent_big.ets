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

// arktsid: string_exponent_big
// description: Return the string consisting of the single digit of s, followed by lowercase character 'e', a sign and
// the decimal representation of abs(n-1) for numbers with an exponent
// Conversion notes: integer literals 1000000000000000000000 (1e21) and 10000000000000000000000 (1e22)
//   exceed ArkTS long range (ESY0249), replaced by the numerically identical double literals.

function main(): void {
    arktest.assertEQ(String(1e21), '1e+21', '#1: String(1e21) === \'1e+21\'');
    arktest.assertEQ(String(1e22), '1e+22', '#2: String(1e22) === \'1e+22\'');
    arktest.assertEQ(String(1e21), '1e+21', '#3: String(1e21) === \'1e+21\'');
    arktest.assertEQ(String(1.0e22), '1e+22', '#4: String(1.0e22) === \'1e+22\'');
    arktest.assertEQ(String(1E21), '1e+21', '#5: String(1E21) === \'1e+21\'');
    arktest.assertEQ(String(1.0E22), '1e+22', '#6: String(1.0E22) === \'1e+22\'');
    arktest.assertEQ(String(-1e21), '-1e+21', '#7: String(-1e21) === \'-1e+21\'');
    arktest.assertEQ(String(-1e22), '-1e+22', '#8: String(-1e22) === \'-1e+22\'');
    arktest.assertEQ(String(-1e21), '-1e+21', '#9: String(-1e21) === \'-1e+21\'');
    arktest.assertEQ(String(-1.0e22), '-1e+22', '#10: String(-1.0e22) === \'-1e+22\'');
    arktest.assertEQ(String(-1E21), '-1e+21', '#11: String(-1E21) === \'-1e+21\'');
    arktest.assertEQ(String(-1.0E22), '-1e+22', '#12: String(-1.0E22) === \'-1e+22\'');
}