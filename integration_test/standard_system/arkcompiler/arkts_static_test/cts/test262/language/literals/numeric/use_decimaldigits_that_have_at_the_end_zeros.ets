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

// arktsid: use_decimaldigits_that_have_at_the_end_zeros
// description: Use .DecimalDigits that have at the end zeros

function main(): void {
    arktest.assertEQ(0.00, 0.0, '#0: 0.0 === 0.0');
    arktest.assertEQ(0.10, 0.1, '#1: 0.1 === 0.1');
    arktest.assertEQ(0.20, 0.2, '#2: 0.2 === 0.2');
    arktest.assertEQ(0.30, 0.3, '#3: 0.3 === 0.3');
    arktest.assertEQ(0.40, 0.4, '#4: 0.4 === 0.4');
    arktest.assertEQ(0.50, 0.5, '#5: 0.5 === 0.5');
    arktest.assertEQ(0.60, 0.6, '#6: 0.6 === 0.6');
    arktest.assertEQ(0.70, 0.7, '#7: 0.7 === 0.7');
    arktest.assertEQ(0.80, 0.8, '#8: 0.8 === 0.8');
    arktest.assertEQ(0.90, 0.9, '#9: 0.9 === 0.9');
}
