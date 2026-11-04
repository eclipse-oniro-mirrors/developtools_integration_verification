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
// arktsid: math_log1p_specific_results
// description: Math.log1p special values: x<-1 NaN, -1 -> -Infinity, 0 -> +0, -0 -> -0, +Infinity

function main(): void {
    arktest.assertTrue(isNaN(Math.log1p(NaN)), 'NaN');
    arktest.assertTrue(isNaN(Math.log1p(-1.000001)), '-1.000001');
    arktest.assertTrue(isNaN(Math.log1p(-2)), '-2');
    arktest.assertTrue(isNaN(Math.log1p(-Infinity)), '-Infinity');
    arktest.assertEQ(Math.log1p(-1), -Infinity, '-1');
    arktest.assertPositiveZero(Math.log1p(0), '0');
    arktest.assertNegativeZero(Math.log1p(-0), '-0');
    arktest.assertEQ(Math.log1p(Infinity), Infinity, 'Infinity');
}