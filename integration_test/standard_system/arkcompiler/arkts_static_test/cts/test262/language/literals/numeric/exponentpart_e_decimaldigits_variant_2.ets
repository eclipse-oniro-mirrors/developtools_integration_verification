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

// arktsid: exponentpart_e_decimaldigits_variant_2
// description: ExponentPart :: E DecimalDigits

function main(): void {
    arktest.assertEQ(0E1, 0, '#0: 0E1 === 0');
    arktest.assertEQ(1E1, 10, '#1: 1E1 === 1');
    arktest.assertEQ(2E1, 20, '#2: 2E1 === 20');
    arktest.assertEQ(3E1, 30, '#3: 3E1 === 30');
    arktest.assertEQ(4E1, 40, '#4: 4E1 === 40');
    arktest.assertEQ(5E1, 50, '#5: 5E1 === 50');
    arktest.assertEQ(6E1, 60, '#6: 6E1 === 60');
    arktest.assertEQ(7E1, 70, '#7: 7E1 === 70');
    arktest.assertEQ(8E1, 80, '#8: 8E1 === 80');
    arktest.assertEQ(9E1, 90, '#9: 9E1 === 90');
}
