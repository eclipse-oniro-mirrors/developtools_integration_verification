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

// arktsid: underflow_division
// description: A quotient too small to represent becomes a signed zero

function main(): void {
    let minValue: double = 5.0e-324;
    let positiveInfinity: double = 1.0 / 0.0;
    let negativeInfinity: double = -1.0 / 0.0;
    let positiveZero: double = minValue / 2.1;
    let negativeZero: double = minValue / -2.1;
    arktest.assertEQ(positiveZero, 0.0, 'positive underflow is zero');
    arktest.assertEQ(negativeZero, -0.0, 'negative underflow is negative zero');
    arktest.assertEQ(1.0 / negativeZero, negativeInfinity, 'negative underflow sign');
    arktest.assertEQ(minValue / 1.9, minValue, 'minimum value divided by 1.9');
    arktest.assertEQ(minValue / -1.9, -minValue, 'minimum value divided by negative 1.9');
    arktest.assertEQ(1.0 / positiveZero, positiveInfinity, 'positive underflow sign');
}

