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

// arktsid: exponentpart_e_decimaldigits_variant_12
// description: ExponentPart :: E +DecimalDigits

function main(): void {
    arktest.assertEQ(0.0E+1, 0, '#0: 0.0E+1 === 0');
    arktest.assertEQ(0.1E+1, 1, '#1: 0.1E+1 === 1');
    arktest.assertEQ(0.2E+1, 2, '#2: 0.2E+1 === 2');
    arktest.assertEQ(0.3E+1, 3, '#3: 0.3E+1 === 3');
    arktest.assertEQ(0.4E+1, 4, '#4: 0.4E+1 === 4');
    arktest.assertEQ(0.5E+1, 5, '#5: 0.5E+1 === 5');
    arktest.assertEQ(0.6E+1, 6, '#6: 0.6E+1 === 6');
    arktest.assertEQ(0.7E+1, 7, '#7: 0.7E+1 === 7');
    arktest.assertEQ(0.8E+1, 8, '#8: 0.8E+1 === 8');
    arktest.assertEQ(0.9E+1, 9, '#9: 0.9E+1 === 9');
}
