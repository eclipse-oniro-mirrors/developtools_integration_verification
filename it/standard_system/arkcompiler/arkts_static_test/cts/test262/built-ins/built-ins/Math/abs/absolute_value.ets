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
// arktsid: math_abs_absolute_value
// description: Math.abs returns the absolute value of x

function main(): void {
    arktest.assertEQ(Math.abs(-42), 42, '-42');
    arktest.assertEQ(Math.abs(42), 42, '42');
    arktest.assertEQ(Math.abs(-0.000001), 0.000001, '-0.000001');
    arktest.assertEQ(Math.abs(0.000001), 0.000001, '0.000001');
    arktest.assertEQ(Math.abs(-1e-17), 1e-17, '-1e-17');
    arktest.assertEQ(Math.abs(1e-17), 1e-17, '1e-17');
    arktest.assertEQ(Math.abs(-9007199254740991), 9007199254740991, '-(2**53-1)');
    arktest.assertEQ(Math.abs(9007199254740991), 9007199254740991, '2**53-1');
}