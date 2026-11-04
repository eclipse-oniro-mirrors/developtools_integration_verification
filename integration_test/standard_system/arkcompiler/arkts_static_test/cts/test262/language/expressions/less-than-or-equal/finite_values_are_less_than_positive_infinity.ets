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

// arktsid: finite_values_are_less_than_positive_infinity
// description: Finite values are less than or equal to positive infinity

function main(): void {
    arktest.assertTrue(0 <= Number.POSITIVE_INFINITY);
    arktest.assertTrue(1.1 <= Number.POSITIVE_INFINITY);
    arktest.assertTrue(-1.1 <= Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.NEGATIVE_INFINITY <= Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.MAX_VALUE <= Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.MIN_VALUE <= Number.POSITIVE_INFINITY);
}
