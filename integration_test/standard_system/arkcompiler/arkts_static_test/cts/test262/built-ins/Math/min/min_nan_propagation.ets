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
// arktsid: math_min_nan_propagation
// description: Math.min returns NaN when any of 1/2/3 arguments is NaN

function main(): void {
    let vals: double[] = [-Infinity, -0.000000000000001, -0.0, 0.0, 0.000000000000001, Infinity, NaN];
    arktest.assertTrue(isNaN(Math.min(NaN)), 'min(NaN)');
    for (let i = 0; i < vals.length; i++) {
        arktest.assertTrue(isNaN(Math.min(NaN, vals[i])), 'min(NaN, v)');
        arktest.assertTrue(isNaN(Math.min(vals[i], NaN)), 'min(v, NaN)');
        arktest.assertTrue(isNaN(Math.min(NaN, vals[i], 0.0)), 'min(NaN, v, 0)');
        arktest.assertTrue(isNaN(Math.min(vals[i], NaN, 0.0)), 'min(v, NaN, 0)');
    }
}