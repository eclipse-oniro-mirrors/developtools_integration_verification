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
// arktsid: number_string_hex_c
// description: Compare Number('0xC'), Number('0XC'), Number('0xc') and Number('0Xc') with 12

function main(): void {
    arktest.assertEQ(Number('0xc'), 12, 'Number("0xc") must return 12');
    arktest.assertEQ(Number('0xC'), 12, 'The value of `+("0xC")` is expected to be 12');
    arktest.assertEQ(Number('0Xc'), 12, 'Number("0Xc") must return 12');
    arktest.assertEQ(Number('0XC'), 12, 'Number("0XC") must return 12');
}