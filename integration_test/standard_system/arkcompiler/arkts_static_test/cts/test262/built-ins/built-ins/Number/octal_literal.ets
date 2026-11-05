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
// arktsid: number_octal_literal
// description: Mathematical value of valid octal integer literals

function main(): void {
    arktest.assertEQ(Number('0o0'), 0, 'lower-case head');
    arktest.assertEQ(Number('0O0'), 0, 'upper-case head');
    arktest.assertEQ(Number('0o00'), 0, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0O00'), 0, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0o1'), 1, 'lower-case head');
    arktest.assertEQ(Number('0O1'), 1, 'upper-case head');
    arktest.assertEQ(Number('0o01'), 1, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0O01'), 1, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0o7'), 7, 'lower-case head');
    arktest.assertEQ(Number('0O7'), 7, 'upper-case head');
    arktest.assertEQ(Number('0o07'), 7, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0O07'), 7, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0o10'), 8, 'lower-case head');
    arktest.assertEQ(Number('0O10'), 8, 'upper-case head');
    arktest.assertEQ(Number('0o010'), 8, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0O010'), 8, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0o11'), 9, 'lower-case head');
    arktest.assertEQ(Number('0O11'), 9, 'upper-case head');
    arktest.assertEQ(Number('0o011'), 9, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0O011'), 9, 'upper-case head with leading zeros');
    arktest.assertEQ(Number('0o77'), 63, 'lower-case head');
    arktest.assertEQ(Number('0O77'), 63, 'upper-case head');
    arktest.assertEQ(Number('0o077'), 63, 'lower-case head with leading zeros');
    arktest.assertEQ(Number('0O077'), 63, 'upper-case head with leading zeros');
}