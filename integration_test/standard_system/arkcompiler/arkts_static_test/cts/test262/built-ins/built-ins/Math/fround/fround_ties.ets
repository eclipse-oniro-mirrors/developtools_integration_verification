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
// arktsid: math_fround_ties
// description: Math.fround rounds ties to even (float32 rounding of values near 1.0)

function main(): void {
    let a0: double = 1.0;
    let a1: double = 1.0000000596046448;
    let a2: double = 1.0000001192092896;
    let a3: double = 1.0000001788139343;
    let a4: double = 1.000000238418579;
    let a5: double = 1.0000002980232239;
    let a6: double = 1.0000003576278687;
    arktest.assertEQ(Math.fround(a0), a0, 'fround(a0)');
    arktest.assertEQ(Math.fround(a1), a0, 'fround(a1)');
    arktest.assertEQ(Math.fround(a2), a2, 'fround(a2)');
    arktest.assertEQ(Math.fround(a3), a4, 'fround(a3)');
    arktest.assertEQ(Math.fround(a4), a4, 'fround(a4)');
    arktest.assertEQ(Math.fround(a5), a4, 'fround(a5)');
    arktest.assertEQ(Math.fround(a6), a6, 'fround(a6)');
    arktest.assertEQ(Math.fround(-a0), -a0, 'fround(-a0)');
    arktest.assertEQ(Math.fround(-a1), -a0, 'fround(-a1)');
    arktest.assertEQ(Math.fround(-a2), -a2, 'fround(-a2)');
    arktest.assertEQ(Math.fround(-a3), -a4, 'fround(-a3)');
    arktest.assertEQ(Math.fround(-a4), -a4, 'fround(-a4)');
    arktest.assertEQ(Math.fround(-a5), -a4, 'fround(-a5)');
    arktest.assertEQ(Math.fround(-a6), -a6, 'fround(-a6)');
}