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

// arktsid: division_infinity_by_zero
// description: Division of infinity by zero keeps the appropriate sign

function main(): void {
    let positiveInfinity: double = 1.0 / 0.0;
    let negativeInfinity: double = -1.0 / 0.0;
    let positiveZero: double = 0.0;
    let negativeZero: double = -0.0;
    arktest.assertEQ(negativeInfinity / positiveZero, negativeInfinity, 'negative infinity by positive zero');
    arktest.assertEQ(negativeInfinity / negativeZero, positiveInfinity, 'negative infinity by negative zero');
    arktest.assertEQ(positiveInfinity / positiveZero, positiveInfinity, 'positive infinity by positive zero');
    arktest.assertEQ(positiveInfinity / negativeZero, negativeInfinity, 'positive infinity by negative zero');
}

