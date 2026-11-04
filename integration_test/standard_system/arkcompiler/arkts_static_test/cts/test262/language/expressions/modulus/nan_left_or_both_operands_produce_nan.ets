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

// arktsid: nan_left_or_both_operands_produce_nan
// description: A NaN dividend or either NaN operand makes remainder produce NaN

function main(): void {
    arktest.assertTrue(Number.isNaN(Number.NaN % Number.NaN));
    arktest.assertTrue(Number.isNaN(Number.NaN % 0.0));
    arktest.assertTrue(Number.isNaN(Number.NaN % -0.0));
    arktest.assertTrue(Number.isNaN(Number.NaN % Number.POSITIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.NaN % Number.NEGATIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.NaN % Number.MAX_VALUE));
    arktest.assertTrue(Number.isNaN(Number.NaN % Number.MIN_VALUE));
    arktest.assertTrue(Number.isNaN(Number.NaN % 1.0));
}
