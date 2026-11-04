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
// arktsid: number_string_hex_e
// description: Compare Number('0xE'), Number('0XE'), Number('0xe') and Number('0Xe') with 14

function main(): void {
    arktest.assertEQ(Number('0xe'), 14, 'Number("0xe") must return 14');
    arktest.assertEQ(Number('0xE'), 14, 'Number("0xE") must return 14');
    arktest.assertEQ(Number('0Xe'), 14, 'Number("0Xe") must return 14');
    arktest.assertEQ(Number('0XE'), 14, 'The value of `+("0XE")` is expected to be 14');
}