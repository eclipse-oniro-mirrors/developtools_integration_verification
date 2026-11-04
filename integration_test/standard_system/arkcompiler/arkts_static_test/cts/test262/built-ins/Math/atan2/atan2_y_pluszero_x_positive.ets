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
// arktsid: math_atan2_y_pluszero_x_positive
// description: Math.atan2(+0, x) is +0 for positive finite x and +Infinity

function main(): void {
    let x: double[] = [0.000000000000001, 1.0, Infinity];
    for (let i = 0; i < x.length; i++) {
        arktest.assertPositiveZero(Math.atan2(0.0, x[i]), 'atan2(+0, x)');
    }
}