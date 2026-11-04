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
// arktsid: number_binary_literal_invalid
// description: Invalid binary literals yield NaN

function main(): void {
    arktest.assertTrue(isNaN(Number('0b2')), 'invalid digit');
    arktest.assertTrue(isNaN(Number('00b0')), 'leading zero');
    arktest.assertTrue(isNaN(Number('0b')), 'omitted digits');
    arktest.assertTrue(isNaN(Number('+0b1')), 'plus sign');
    arktest.assertTrue(isNaN(Number('-0b1')), 'minus sign');
    arktest.assertTrue(isNaN(Number('0b1.01')), 'fractional part');
    arktest.assertTrue(isNaN(Number('0b1e10')), 'exponent part');
    arktest.assertTrue(isNaN(Number('0b1e-10')), 'exponent part with a minus sign');
    arktest.assertTrue(isNaN(Number('0b1e+10')), 'exponent part with a plus sign');
}