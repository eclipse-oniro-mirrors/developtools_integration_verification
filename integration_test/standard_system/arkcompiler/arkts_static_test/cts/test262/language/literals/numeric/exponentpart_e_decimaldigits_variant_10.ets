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

// arktsid: exponentpart_e_decimaldigits_variant_10
// description: ExponentPart :: E +DecimalDigits

function main(): void {
    arktest.assertEQ(0.0E-1, 0, '#0: 0.0E-1 === 0');
    arktest.assertEQ(0.1E-1, 0.01, '#1: 0.1E-1 === 0.01');
    arktest.assertEQ(0.2E-1, 0.02, '#2: 0.2E-1 === 0.02');
    arktest.assertEQ(0.3E-1, 0.03, '#3: 0.3E-1 === 0.03');
    arktest.assertEQ(0.4E-1, 0.04, '#4: 0.4E-1 === 0.04');
    arktest.assertEQ(0.5E-1, 0.05, '#5: 0.5E-1 === 0.05');
    arktest.assertEQ(0.6E-1, 0.06, '#6: 0.6E-1 === 0.06');
    arktest.assertEQ(0.7E-1, 0.07, '#7: 0.7E-1 === 0.07');
    arktest.assertEQ(0.8E-1, 0.08, '#8: 0.8E-1 === 0.08');
    arktest.assertEQ(0.9E-1, 0.09, '#9: 0.9E-1 === 0.09');
}
