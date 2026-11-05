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
// arktsid: number_special_values_to_number
// description: Number.NaN, +0, -0, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY, Number.MAX_VALUE and
// Number.MIN_VALUE convert to Number by explicit

function main(): void {
    arktest.assertTrue(isNaN(Number(NaN)), 'Number(true) returns NaN');
    arktest.assertEQ(Number(+0), +0, 'Number(+0) must return +0');
    arktest.assertNegativeZero(Number(-0), 'Number(-0) must return -0');
        arktest.assertEQ(Number(Number.POSITIVE_INFINITY), Number.POSITIVE_INFINITY,
        'Number(Number.POSITIVE_INFINITY) returns Number.POSITIVE_INFINITY');
        arktest.assertEQ(Number(Number.NEGATIVE_INFINITY), Number.NEGATIVE_INFINITY,
        'Number(Number.NEGATIVE_INFINITY) returns Number.NEGATIVE_INFINITY');
    arktest.assertEQ(Number(Number.MAX_VALUE), Number.MAX_VALUE, 'Number(Number.MAX_VALUE) returns Number.MAX_VALUE');
    arktest.assertEQ(Number(Number.MIN_VALUE), Number.MIN_VALUE, 'Number(Number.MIN_VALUE) returns Number.MIN_VALUE');
}