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
// arktsid: number_string_long_number
// description: Use various long numbers, for example, 1234567890.1234567890

function main(): void {
        arktest.assertEQ(Number('1234567890.1234567890'), 1234567890.1234567890,
        'Number("1234567890.1234567890") must return 1234567890.1234567890');
        arktest.assertEQ(Number('1234567890.1234567890'), 1234567890.1234567000,
        'Number("1234567890.1234567890") must return 1234567890.1234567000');
        arktest.assertNE(Number('1234567890.1234567890'), 1234567890.123456,
        'The value of +("1234567890.1234567890") is not 1234567890.123456');
        arktest.assertEQ(Number('0.12345678901234567890'), 0.123456789012345678,
        'Number("0.12345678901234567890") must return 0.123456789012345678');
        arktest.assertEQ(Number('00.12345678901234567890'), 0.123456789012345678,
        'Number("00.12345678901234567890") must return 0.123456789012345678');
}