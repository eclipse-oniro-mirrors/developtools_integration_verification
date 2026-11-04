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
// arktsid: number_string_hex_f
// description: Compare Number('0xF'), Number('0XF'), Number('0xf') and Number('0Xf') with 15

function main(): void {
    arktest.assertEQ(Number('0xf'), 15, 'Number("0xf") must return 15');
    arktest.assertEQ(Number('0xF'), 15, 'Number("0xF") must return 15');
    arktest.assertEQ(Number('0Xf'), 15, 'The value of `+("0Xf")` is expected to be 15');
    arktest.assertEQ(Number('0XF'), 15, 'Number("0XF") must return 15');
}