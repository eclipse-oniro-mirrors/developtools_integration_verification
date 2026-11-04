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
// arktsid: number_string_hex_5
// description: Compare Number('0x5') and Number('0X5') with 5

function main(): void {
    arktest.assertEQ(Number('5'), 5, 'The value of `+("5")` is expected to be 5');
    arktest.assertEQ(Number('0x5'), 5, 'Number("0x5") must return 5');
    arktest.assertEQ(Number('0X5'), 5, 'Number("0X5") must return 5');
}