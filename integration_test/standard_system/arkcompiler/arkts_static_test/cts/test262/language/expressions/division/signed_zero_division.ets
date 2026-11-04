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

// arktsid: signed_zero_division
// description: Division by finite values preserves the appropriate zero sign

function main(): void {
    let positiveZero: double = 0.0;
    let negativeZero: double = -0.0;
    let positiveInfinity: double = 1.0 / 0.0;
    let negativeInfinity: double = -1.0 / 0.0;
    arktest.assertEQ(1.0 / (negativeZero / 1.0), negativeInfinity, 'negative zero by positive one');
    arktest.assertEQ(1.0 / (negativeZero / -1.0), positiveInfinity, 'negative zero by negative one');
    arktest.assertEQ(1.0 / (positiveZero / 1.0), positiveInfinity, 'positive zero by positive one');
    arktest.assertEQ(1.0 / (positiveZero / -1.0), negativeInfinity, 'positive zero by negative one');
}

