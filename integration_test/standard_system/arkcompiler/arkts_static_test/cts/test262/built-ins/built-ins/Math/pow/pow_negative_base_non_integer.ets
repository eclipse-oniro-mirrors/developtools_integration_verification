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
// arktsid: math_pow_negative_base_non_integer
// description: Math.pow(negative base, non-integer exponent) is NaN

function main(): void {
    let base: double[] = [-1.7976931348623157e308, -Math.PI, -1.0, -0.000000000000001];
    let exponent: double[] = [ -Math.PI, -Math.E, -1.000000000000001, -0.000000000000001, 0.000000000000001,
        1.000000000000001, Math.E, Math.PI];
    for (let i = 0; i < base.length; i++) {
        for (let j = 0; j < exponent.length; j++) {
            arktest.assertTrue(isNaN(Math.pow(base[i], exponent[j])), 'pow(negative, non-integer) is NaN');
        }
    }
}