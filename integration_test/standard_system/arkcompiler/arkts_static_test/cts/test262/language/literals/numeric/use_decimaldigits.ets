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

// arktsid: use_decimaldigits
// description: Use .DecimalDigits

function main(): void {
    arktest.assertEQ(0.00, 0.00, '#0: 0.00 === 0.00');
    arktest.assertEQ(0.11, 0.11, '#1: 0.11 === 0.11');
    arktest.assertEQ(0.22, 0.22, '#2: 0.22 === 0.22');
    arktest.assertEQ(0.33, 0.33, '#3: 0.33 === 0.33');
    arktest.assertEQ(0.44, 0.44, '#4: 0.44 === 0.44');
    arktest.assertEQ(0.55, 0.55, '#5: 0.55 === 0.55');
    arktest.assertEQ(0.66, 0.66, '#6: 0.66 === 0.66');
    arktest.assertEQ(0.77, 0.77, '#7: 0.77 === 0.77');
    arktest.assertEQ(0.88, 0.88, '#8: 0.88 === 0.88');
    arktest.assertEQ(0.99, 0.99, '#9: 0.99 === 0.99');
}
