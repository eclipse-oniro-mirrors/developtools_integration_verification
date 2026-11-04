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
// arktsid: math_asinh_special_vals
// description: Math.asinh special values: NaN, +/-Infinity, +/-0

function main(): void {
    arktest.assertTrue(isNaN(Math.asinh(NaN)), 'asinh(NaN)');
    arktest.assertEQ(Math.asinh(-Infinity), -Infinity, 'asinh(-Infinity)');
    arktest.assertEQ(Math.asinh(Infinity), Infinity, 'asinh(+Infinity)');
    arktest.assertEQ(1.0 / Math.asinh(-0.0), -Infinity, 'asinh(-0) is -0');
    arktest.assertEQ(1.0 / Math.asinh(0.0), Infinity, 'asinh(0) is +0');
}