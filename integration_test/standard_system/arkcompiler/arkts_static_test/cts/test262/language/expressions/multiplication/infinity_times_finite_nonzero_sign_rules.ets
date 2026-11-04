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

// arktsid: infinity_times_finite_nonzero_sign_rules
// description: Multiplication of infinity and finite nonzero values produces signed infinity

function main(): void {
    arktest.assertEQ(Number.NEGATIVE_INFINITY * -1.0, Number.POSITIVE_INFINITY);
    arktest.assertEQ(-1.0 * Number.NEGATIVE_INFINITY, Number.POSITIVE_INFINITY);
    arktest.assertEQ(Number.POSITIVE_INFINITY * -1.0, Number.NEGATIVE_INFINITY);
    arktest.assertEQ(-1.0 * Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY);
    arktest.assertEQ(Number.POSITIVE_INFINITY * Number.MAX_VALUE, Number.POSITIVE_INFINITY);
    arktest.assertEQ(Number.POSITIVE_INFINITY * Number.MAX_VALUE, Number.MAX_VALUE * Number.POSITIVE_INFINITY);
    arktest.assertEQ(Number.NEGATIVE_INFINITY * Number.MIN_VALUE, Number.NEGATIVE_INFINITY);
    arktest.assertEQ(Number.NEGATIVE_INFINITY * Number.MIN_VALUE, Number.MIN_VALUE * Number.NEGATIVE_INFINITY);
}
