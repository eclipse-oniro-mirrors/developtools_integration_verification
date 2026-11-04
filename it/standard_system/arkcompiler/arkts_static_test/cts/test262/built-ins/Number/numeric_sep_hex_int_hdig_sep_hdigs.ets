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
// arktsid: number_numeric_sep_hex_int_hdig_sep_hdigs
// description: NumericLiteralSeparator is not valid on string conversions for ToNumber operations

function main(): void {
    arktest.assertTrue(isNaN(Number('0x0_10')), '0x0_10');
    arktest.assertTrue(isNaN(Number('0X0_10')), '0X0_10');
}