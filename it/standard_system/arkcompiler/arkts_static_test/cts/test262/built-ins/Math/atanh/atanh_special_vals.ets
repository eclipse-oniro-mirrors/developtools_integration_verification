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
// arktsid: math_atanh_special_vals
// description: Math.atanh special values: |x|>1 NaN, x=+/-1 +/-Infinity, +/-0

function main(): void {
    arktest.assertTrue(isNaN(Math.atanh(-1.9)), 'atanh(-1.9)');
    arktest.assertTrue(isNaN(Math.atanh(NaN)), 'atanh(NaN)');
    arktest.assertTrue(isNaN(Math.atanh(-10)), 'atanh(-10)');
    arktest.assertTrue(isNaN(Math.atanh(-Infinity)), 'atanh(-Infinity)');
    arktest.assertTrue(isNaN(Math.atanh(1.9)), 'atanh(1.9)');
    arktest.assertTrue(isNaN(Math.atanh(10)), 'atanh(10)');
    arktest.assertTrue(isNaN(Math.atanh(Infinity)), 'atanh(+Infinity)');
    arktest.assertEQ(Math.atanh(-1), -Infinity, 'atanh(-1) is -Infinity');
    arktest.assertEQ(Math.atanh(1), Infinity, 'atanh(+1) is +Infinity');
    arktest.assertEQ(1.0 / Math.atanh(-0.0), -Infinity, 'atanh(-0) is -0');
    arktest.assertEQ(1.0 / Math.atanh(0.0), Infinity, 'atanh(0) is +0');
}