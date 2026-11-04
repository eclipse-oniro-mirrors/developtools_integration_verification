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
// arktsid: string_call_fraction_leading_zero
// description: String called as a function on fractions less than 1 produces leading zero / exponential notation

function main(): void {
    let s: string = String(0.12345);
    arktest.assertEQ(s, '0.12345', 'String(0.12345) is \'0.12345\'');

    s = String(0.012345);
    arktest.assertEQ(s, '0.012345', 'String(0.012345) is \'0.012345\'');

    s = String(0.0012345);
    arktest.assertEQ(s, '0.0012345', 'String(0.0012345) is \'0.0012345\'');

    s = String(0.00000012345);
    arktest.assertEQ(s, '1.2345e-7', 'String(0.00000012345) is \'1.2345e-7\'');
}