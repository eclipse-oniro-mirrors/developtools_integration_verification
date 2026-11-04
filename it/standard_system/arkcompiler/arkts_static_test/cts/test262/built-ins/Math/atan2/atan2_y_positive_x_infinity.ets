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
// arktsid: math_atan2_y_positive_x_infinity
// description: Math.atan2(y, +Infinity) is +0 for finite positive y

function main(): void {
    let y: double[] = [0.000000000000001, 1.0, 1.7976931348623157e308];
    let x: double = Infinity;
    for (let i = 0; i < y.length; i++) {
        arktest.assertPositiveZero(Math.atan2(y[i], x), 'atan2(y, +Infinity)');
    }
}