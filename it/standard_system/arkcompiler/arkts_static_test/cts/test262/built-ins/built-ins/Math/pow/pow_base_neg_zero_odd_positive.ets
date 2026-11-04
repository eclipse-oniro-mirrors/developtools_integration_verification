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
// arktsid: math_pow_base_neg_zero_odd_positive
// description: Math.pow(-0, positive odd integer) is -0

function main(): void {
    let exponent: double[] = [1.0, 111.0, 111111.0];
    for (let i = 0; i < exponent.length; i++) {
        arktest.assertNegativeZero(Math.pow(-0.0, exponent[i]), 'pow(-0, odd positive) is -0');
    }
}