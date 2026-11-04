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
// arktsid: math_log2_basic_tests
// description: Math.log2 special values: +/-0 -> -Infinity, negatives NaN, 1 -> 0, powers of 2
// Conversion notes: Dropped Math.log2(null)/undefined coercion assertions - ArkTS statically rejects null/undefined as
// number arguments (no ToNumber coercion).

function main(): void {
    arktest.assertEQ(Math.log2(-0.0), -Infinity, 'log2(-0)');
    arktest.assertEQ(Math.log2(0.0), -Infinity, 'log2(+0)');
    arktest.assertTrue(isNaN(Math.log2(-0.9)), 'log2(-0.9)');
    arktest.assertTrue(isNaN(Math.log2(NaN)), 'log2(NaN)');
    arktest.assertTrue(isNaN(Math.log2(-10)), 'log2(-10)');
    arktest.assertTrue(isNaN(Math.log2(-Infinity)), 'log2(-Infinity)');
    arktest.assertEQ(Math.log2(Infinity), Infinity, 'log2(+Infinity)');
    arktest.assertPositiveZero(Math.log2(1), 'log2(1) is +0');
    arktest.assertEQ(Math.log2(2.0), 1, 'log2(2) is 1');
    arktest.assertEQ(Math.log2(4.0), 2, 'log2(4) is 2');
    arktest.assertEQ(Math.log2(8.0), 3, 'log2(8) is 3');
}