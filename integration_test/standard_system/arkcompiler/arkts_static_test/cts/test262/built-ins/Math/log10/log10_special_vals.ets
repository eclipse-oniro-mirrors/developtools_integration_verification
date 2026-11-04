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
// arktsid: math_log10_special_vals
// description: Math.log10 special values: +/-0 -> -Infinity, negatives NaN, 1 -> 0, powers of 10
// Conversion notes: Dropped Math.log10(null)/undefined coercion assertions - ArkTS statically rejects null/undefined as
// number arguments (no ToNumber coercion).

function main(): void {
    arktest.assertEQ(Math.log10(-0.0), -Infinity, 'log10(-0)');
    arktest.assertEQ(Math.log10(0.0), -Infinity, 'log10(+0)');
    arktest.assertTrue(isNaN(Math.log10(-0.9)), 'log10(-0.9)');
    arktest.assertTrue(isNaN(Math.log10(NaN)), 'log10(NaN)');
    arktest.assertTrue(isNaN(Math.log10(-10)), 'log10(-10)');
    arktest.assertEQ(Math.log10(Infinity), Infinity, 'log10(+Infinity)');
    arktest.assertPositiveZero(Math.log10(1), 'log10(1) is +0');
    arktest.assertEQ(Math.log10(10.0), 1, 'log10(10) is 1');
    arktest.assertEQ(Math.log10(100.0), 2, 'log10(100) is 2');
    arktest.assertEQ(Math.log10(1000.0), 3, 'log10(1000) is 3');
}