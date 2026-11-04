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

// arktsid: overflow_to_infinity
// description: A finite quotient that is too large becomes infinity

function main(): void {
    let maxValue: double = 1.7976931348623157e308;
    let positiveInfinity: double = 1.0 / 0.0;
    let negativeInfinity: double = -1.0 / 0.0;
    arktest.assertEQ(maxValue / 0.9, positiveInfinity, 'positive overflow');
    arktest.assertEQ(maxValue / -0.9, negativeInfinity, 'negative overflow');
    arktest.assertEQ(maxValue / 1.0, maxValue, 'maximum divided by one');
    arktest.assertEQ(maxValue / -1.0, -maxValue, 'maximum divided by negative one');
}

