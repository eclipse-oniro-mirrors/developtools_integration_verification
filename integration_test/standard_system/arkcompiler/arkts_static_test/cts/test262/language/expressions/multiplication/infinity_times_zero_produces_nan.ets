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

// arktsid: infinity_times_zero_produces_nan
// description: Multiplication of infinity and zero produces NaN

function main(): void {
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY * 0.0));
    arktest.assertTrue(Number.isNaN(-0.0 * Number.NEGATIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY * -0.0));
    arktest.assertTrue(Number.isNaN(0.0 * Number.POSITIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY * -0.0));
    arktest.assertTrue(Number.isNaN(0.0 * Number.NEGATIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY * 0.0));
    arktest.assertTrue(Number.isNaN(-0.0 * Number.POSITIVE_INFINITY));
}
