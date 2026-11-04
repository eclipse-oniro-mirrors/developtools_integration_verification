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
// arktsid: number_binary_literal
// description: Mathematical value of valid binary integer literals

function main(): void {
    arktest.assertEQ(Number('0b0'), 0, 'lower-case head');
    arktest.assertEQ(Number('0B0'), 0, 'upper-case head');
    arktest.assertEQ(Number('0b00'), 0, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0B00'), 0, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0b1'), 1, 'lower-case head');
    arktest.assertEQ(Number('0B1'), 1, 'upper-case head');
    arktest.assertEQ(Number('0b01'), 1, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0B01'), 1, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0b10'), 2, 'lower-case head');
    arktest.assertEQ(Number('0B10'), 2, 'upper-case head');
    arktest.assertEQ(Number('0b010'), 2, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0B010'), 2, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0b11'), 3, 'lower-case head');
    arktest.assertEQ(Number('0B11'), 3, 'upper-case head');
    arktest.assertEQ(Number('0b011'), 3, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0B011'), 3, 'upper-case head with leading zeros');
}