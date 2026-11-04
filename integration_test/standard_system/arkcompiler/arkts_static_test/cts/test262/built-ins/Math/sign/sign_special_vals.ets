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
// arktsid: math_sign_special_vals
// description: Math.sign special values: NaN, +/-0, +/-small, +/-1, +/-Infinity

function main(): void {
    arktest.assertTrue(isNaN(Math.sign(NaN)), 'NaN');
    arktest.assertNegativeZero(Math.sign(-0.0), '-0');
    arktest.assertPositiveZero(Math.sign(0.0), '0');
    arktest.assertEQ(Math.sign(-0.000001), -1, '-0.000001');
    arktest.assertEQ(Math.sign(-1), -1, '-1');
    arktest.assertEQ(Math.sign(-Infinity), -1, '-Infinity');
    arktest.assertEQ(Math.sign(0.000001), 1, '0.000001');
    arktest.assertEQ(Math.sign(1), 1, '1');
    arktest.assertEQ(Math.sign(Infinity), 1, 'Infinity');
}