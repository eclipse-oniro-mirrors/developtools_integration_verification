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

// arktsid: nan_right_division
// description: A NaN right operand makes division produce NaN

function main(): void {
    let nan: double = 0.0 / 0.0;
    let positiveInfinity: double = 1.0 / 0.0;
    let negativeInfinity: double = -1.0 / 0.0;
    let maxValue: double = 1.7976931348623157e308;
    let minValue: double = 5.0e-324;
    let results: double[] = [
        nan / nan,
        0.0 / nan,
        -0.0 / nan,
        positiveInfinity / nan,
        negativeInfinity / nan,
        maxValue / nan,
        minValue / nan,
        1.0 / nan
    ];
    for (let value of results) {
        arktest.assertTrue(value !== value, 'NaN right operand produces NaN');
    }
}

