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
// arktsid: number_string_hex_4
// description: Compare Number('0x4') and Number('0X4') with 4

function main(): void {
    arktest.assertEQ(Number('4'), 4, 'Number("4") must return 4');
    arktest.assertEQ(Number('0x4'), 4, 'Number("0x4") must return 4');
    arktest.assertEQ(Number('0X4'), 4, 'The value of `+("0X4")` is expected to be 4');
}