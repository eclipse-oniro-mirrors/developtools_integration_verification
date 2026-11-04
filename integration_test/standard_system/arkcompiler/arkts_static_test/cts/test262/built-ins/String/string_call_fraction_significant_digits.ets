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
// arktsid: string_call_fraction_significant_digits
// description: String called as a function on numbers with significant fractional digits

function main(): void {
    let s: string = String(1.2345);
    arktest.assertEQ(s, '1.2345', 'String(1.2345) is \'1.2345\'');

    s = String(1.234567890);
    arktest.assertEQ(s, '1.23456789', 'String(1.234567890) is \'1.23456789\'');

    s = String(1.234500000000000000000000000);
    arktest.assertEQ(s, '1.2345', 'String(1.234500000000000000000000000) is \'1.2345\'');
}