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

// arktsid: base_nan_nonzero_exponent_returns_nan
// description: If the base is NaN and the exponent is nonzero, the result is NaN

function main(): void {
    arktest.assertTrue(Number.isNaN(Number.NaN ** Number.NEGATIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.NaN ** (-1.7976931348623157e308)));
    arktest.assertTrue(Number.isNaN(Number.NaN ** (-1.0e-15)));
    arktest.assertTrue(Number.isNaN(Number.NaN ** 1.0e-15));
    arktest.assertTrue(Number.isNaN(Number.NaN ** 1.7976931348623157e308));
    arktest.assertTrue(Number.isNaN(Number.NaN ** Number.POSITIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.NaN ** Number.NaN));
}
