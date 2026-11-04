/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: finite_value_remainder_by_infinity_equals_dividend
// description: A finite dividend remainder by infinity equals the dividend

function main(): void {
    arktest.assertEQ(1.0 % Number.NEGATIVE_INFINITY, 1.0);
    arktest.assertEQ(1.0 % Number.POSITIVE_INFINITY, 1.0);
    arktest.assertEQ(-1.0 % Number.POSITIVE_INFINITY, -1.0);
    arktest.assertEQ(-1.0 % Number.NEGATIVE_INFINITY, -1.0);
    arktest.assertPositiveZero(0.0 % Number.POSITIVE_INFINITY);
    arktest.assertPositiveZero(0.0 % Number.NEGATIVE_INFINITY);
    arktest.assertNegativeZero(-0.0 % Number.POSITIVE_INFINITY);
    arktest.assertNegativeZero(-0.0 % Number.NEGATIVE_INFINITY);
    arktest.assertEQ(Number.MAX_VALUE % Number.NEGATIVE_INFINITY, Number.MAX_VALUE);
    arktest.assertEQ(Number.MAX_VALUE % Number.POSITIVE_INFINITY, Number.MAX_VALUE);
    arktest.assertEQ(-Number.MAX_VALUE % Number.POSITIVE_INFINITY, -Number.MAX_VALUE);
    arktest.assertEQ(-Number.MAX_VALUE % Number.NEGATIVE_INFINITY, -Number.MAX_VALUE);
    arktest.assertEQ(Number.MIN_VALUE % Number.NEGATIVE_INFINITY, Number.MIN_VALUE);
    arktest.assertEQ(Number.MIN_VALUE % Number.POSITIVE_INFINITY, Number.MIN_VALUE);
    arktest.assertEQ(-Number.MIN_VALUE % Number.POSITIVE_INFINITY, -Number.MIN_VALUE);
    arktest.assertEQ(-Number.MIN_VALUE % Number.NEGATIVE_INFINITY, -Number.MIN_VALUE);
}
