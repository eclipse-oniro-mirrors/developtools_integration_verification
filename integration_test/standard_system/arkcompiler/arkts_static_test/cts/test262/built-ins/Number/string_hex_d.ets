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
// arktsid: number_string_hex_d
// description: Compare Number('0xD'), Number('0XD'), Number('0xd') and Number('0Xd') with 13

function main(): void {
    arktest.assertEQ(Number('0xd'), 13, 'The value of `+("0xd")` is expected to be 13');
    arktest.assertEQ(Number('0xD'), 13, 'Number("0xD") must return 13');
    arktest.assertEQ(Number('0Xd'), 13, 'Number("0Xd") must return 13');
    arktest.assertEQ(Number('0XD'), 13, 'Number("0XD") must return 13');
}