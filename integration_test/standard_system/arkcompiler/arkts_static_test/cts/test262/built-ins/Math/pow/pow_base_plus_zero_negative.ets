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
// arktsid: math_pow_base_plus_zero_negative
// description: Math.pow(+0, negative exponent) is +Infinity

function main(): void {
    let exponent: double[] = [-Infinity, -1.7976931348623157e308, -1.0, -0.000000000000001];
    for (let i = 0; i < exponent.length; i++) {
        arktest.assertEQ(Math.pow(0.0, exponent[i]), Infinity, 'pow(+0, negative) is +Infinity');
    }
}