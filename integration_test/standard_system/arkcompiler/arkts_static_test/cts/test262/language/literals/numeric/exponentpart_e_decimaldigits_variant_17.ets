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

// arktsid: exponentpart_e_decimaldigits_variant_17
// description: ExponentPart :: e +DecimalDigits

function main(): void {
    arktest.assertEQ(0.e+1, 0, '#0: 0.e+1 === 0');
    arktest.assertEQ(1.e+1, 10, '#1: 1.e+1 === 10');
    arktest.assertEQ(2.e+1, 20, '#2: 2.e+1 === 20');
    arktest.assertEQ(3.e+1, 30, '#3: 3.e+1 === 30');
    arktest.assertEQ(4.e+1, 40, '#4: 4.e+1 === 40');
    arktest.assertEQ(5.e+1, 50, '#5: 5.e+1 === 50');
    arktest.assertEQ(6.e+1, 60, '#6: 6.e+1 === 60');
    arktest.assertEQ(7.e+1, 70, '#7: 7.e+1 === 70');
    arktest.assertEQ(8.e+1, 80, '#8: 8.e+1 === 80');
    arktest.assertEQ(9.e+1, 90, '#9: 9.e+1 === 90');
}
