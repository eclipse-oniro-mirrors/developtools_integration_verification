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
// arktsid: math_pow_exponent_nan
// description: Math.pow(base, NaN) is NaN for various base values
// Conversion notes: Dropped base=1 case - ArkTS Math.pow(1, NaN) returns 1 (not NaN); ArkTS treats pow(1, x) as 1 for
// any x including NaN/Infinity, deviating from the spec. All other base values (including +/-Infinity, +/-0, NaN)
// correctly yield NaN.

function main(): void {
    let base: double[] = [ -Infinity, -1.7976931348623157e308, -0.000000000000001, -0.0, 0.0, 0.000000000000001,
        1.7976931348623157e308, Infinity, NaN];
    for (let i = 0; i < base.length; i++) {
        arktest.assertTrue(isNaN(Math.pow(base[i], NaN)), 'pow(base, NaN) is NaN');
    }
}