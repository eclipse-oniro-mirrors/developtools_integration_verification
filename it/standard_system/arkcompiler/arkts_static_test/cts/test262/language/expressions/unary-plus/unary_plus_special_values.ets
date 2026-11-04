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

// arktsid: unary_plus_special_values
// description: Special number values are unchanged by unary plus (NaN, ±0, ±Infinity, MAX/MIN)
// Conversion notes: Number.NaN / Number.POSITIVE_INFINITY etc. map to
// Double.NaN / Double.POSITIVE_INFINITY / Double.MAX_VALUE / Double.MIN_VALUE.
// Signed-zero checks use arktest.assertPositiveZero/assertNegativeZero.

function main(): void {
    // CHECK#1: +(NaN) is NaN
    arktest.assertTrue(Number.isNaN(+(Double.NaN)));
    // CHECK#2: +(+0) === +0
    arktest.assertPositiveZero(+(0.0));
    // CHECK#3: +(-0) === -0
    arktest.assertNegativeZero(+(-0.0));
    // CHECK#4: +(+Infinity) === +Infinity
    arktest.assertEQ(+(Double.POSITIVE_INFINITY), Double.POSITIVE_INFINITY);
    // CHECK#5: +(-Infinity) === -Infinity
    arktest.assertEQ(+(Double.NEGATIVE_INFINITY), Double.NEGATIVE_INFINITY);
    // CHECK#6: +(MAX_VALUE) === MAX_VALUE
    arktest.assertEQ(+(Double.MAX_VALUE), Double.MAX_VALUE);
    // CHECK#7: +(MIN_VALUE) === MIN_VALUE
    arktest.assertEQ(+(Double.MIN_VALUE), Double.MIN_VALUE);
}
