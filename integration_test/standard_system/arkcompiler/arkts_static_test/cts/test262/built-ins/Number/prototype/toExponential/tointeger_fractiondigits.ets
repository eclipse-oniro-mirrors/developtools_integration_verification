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

// arktsid: tointeger_fractiondigits
// description: Number.prototype.toExponential applies ToInteger to fractionDigits
// Conversion notes: Boolean/String/Array/null precision args are rejected at compile
//   time in ArkTS (no ToNumber coercion); only numeric (incl. NaN) fractionDigits are
//   represented here. undefined is covered by the no-arg overload.

function main(): void {
    arktest.assertEQ((123.456).toExponential(0.1), '1e+2', '0.1');
    arktest.assertEQ((123.456).toExponential(-0.1), '1e+2', '-0.1');
    arktest.assertEQ((123.456).toExponential(0.9), '1e+2', '0.9');
    arktest.assertEQ((123.456).toExponential(-0.9), '1e+2', '-0.9');
    arktest.assertEQ((123.456).toExponential(NaN), '1e+2', 'NaN');
    arktest.assertEQ((123.456).toExponential(2), '1.23e+2', '2');
    arktest.assertEQ((0.0).toExponential(), '0e+0', 'no arg');
}