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

// arktsid: division_infinity_by_infinity
// description: Division of infinity by infinity produces NaN

function main(): void {
    let positiveInfinity: double = 1.0 / 0.0;
    let negativeInfinity: double = -1.0 / 0.0;
    let nan1: double = negativeInfinity / negativeInfinity;
    let nan2: double = positiveInfinity / positiveInfinity;
    let nan3: double = negativeInfinity / positiveInfinity;
    let nan4: double = positiveInfinity / negativeInfinity;
    arktest.assertTrue(nan1 !== nan1, 'negative infinity by negative infinity is NaN');
    arktest.assertTrue(nan2 !== nan2, 'positive infinity by positive infinity is NaN');
    arktest.assertTrue(nan3 !== nan3, 'negative infinity by positive infinity is NaN');
    arktest.assertTrue(nan4 !== nan4, 'positive infinity by negative infinity is NaN');
}

