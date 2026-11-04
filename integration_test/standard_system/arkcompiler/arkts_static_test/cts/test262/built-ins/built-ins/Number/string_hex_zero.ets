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
// arktsid: number_string_hex_zero
// description: Compare Number('0x0') and Number('0X0') with 0

function main(): void {
    arktest.assertEQ(Number('0'), 0, 'Number("0") must return 0');
    arktest.assertEQ(Number('0x0'), 0, 'The value of `+("0x0")` is expected to be 0');
    arktest.assertEQ(Number('0X0'), 0, 'Number("0X0") must return 0');
}