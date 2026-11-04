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

// arktsid: exponentpart_e_decimaldigits_variant_24
// description: ExponentPart :: E +DecimalDigits

function main(): void {
    arktest.assertEQ(0.0E+1, 0, '#0: 0.0E+1 === 0');
    arktest.assertEQ(1.1E+1, 11, '#1: 1.1E+1 === 11');
    arktest.assertEQ(2.2E+1, 22, '#2: 2.2E+1 === 22');
    arktest.assertEQ(3.3E+1, 33, '#3: 3.3E+1 === 33');
    arktest.assertEQ(4.4E+1, 44, '#4: 4.4E+1 === 44');
    arktest.assertEQ(5.5E+1, 55, '#5: 5.5E+1 === 55');
    arktest.assertEQ(6.6E+1, 66, '#6: 6.E+1 === 66');
    arktest.assertEQ(7.7E+1, 77, '#7: 7.7E+1 === 77');
    arktest.assertEQ(8.8E+1, 88, '#8: 8.8E+1 === 88');
    arktest.assertEQ(9.9E+1, 99, '#9: 9.9E+1 === 99');
}
