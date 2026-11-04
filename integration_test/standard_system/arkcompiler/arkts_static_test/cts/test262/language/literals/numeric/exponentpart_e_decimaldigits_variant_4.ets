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

// arktsid: exponentpart_e_decimaldigits_variant_4
// description: ExponentPart :: E -DecimalDigits

function main(): void {
    arktest.assertEQ(0E-1, 0, '#0: 0E-1 === 0');
    arktest.assertEQ(1E-1, 0.1, '#1: 1E-1 === 0.1');
    arktest.assertEQ(2E-1, 0.2, '#2: 2E-1 === 0.2');
    arktest.assertEQ(3E-1, 0.3, '#3: 3E-1 === 0.3');
    arktest.assertEQ(4E-1, 0.4, '#4: 4E-1 === 0.4');
    arktest.assertEQ(5E-1, 0.5, '#5: 5E-1 === 0.5');
    arktest.assertEQ(6E-1, 0.6, '#6: 6E-1 === 0.6');
    arktest.assertEQ(7E-1, 0.7, '#7: 7E-1 === 0.7');
    arktest.assertEQ(8E-1, 0.8, '#8: 8E-1 === 0.8');
    arktest.assertEQ(9E-1, 0.9, '#9: 9E-1 === 0.9');
}
