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

// arktsid: string_decimal_exponent
// description: Decimal string with exponent part equals (digits + fractional digits) times 10^e

function main(): void {
    arktest.assertEQ((Number('1234') + (Number('5678') * 1e-4)) * 1e9, 1234.5678e9,
        'Number(\'1234.5678e9\') must return (Number(\'1234\') + (Number(\'5678\') * 1e-4)) * 1e9');
    arktest.assertEQ((Number('1234') + (Number('5678') * 1e-4)) * 1e-9, 1234.5678e-9,
        'The value of +(\'1234.5678e-9\') is expected to be (Number(\'1234\') + (Number(\'5678\') * 1e-4)) * 1e-9');
}