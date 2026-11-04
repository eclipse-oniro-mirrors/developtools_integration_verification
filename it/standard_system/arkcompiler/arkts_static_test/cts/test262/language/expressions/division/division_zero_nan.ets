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

// arktsid: division_zero_nan
// description: Division of zero by zero produces NaN

function main(): void {
    let positiveZero: double = 0.0;
    let negativeZero: double = -0.0;
    let nan1: double = positiveZero / positiveZero;
    let nan2: double = negativeZero / positiveZero;
    let nan3: double = positiveZero / negativeZero;
    let nan4: double = negativeZero / negativeZero;
    arktest.assertTrue(nan1 !== nan1, 'positive zero divided by positive zero is NaN');
    arktest.assertTrue(nan2 !== nan2, 'negative zero divided by positive zero is NaN');
    arktest.assertTrue(nan3 !== nan3, 'positive zero divided by negative zero is NaN');
    arktest.assertTrue(nan4 !== nan4, 'negative zero divided by negative zero is NaN');
}

