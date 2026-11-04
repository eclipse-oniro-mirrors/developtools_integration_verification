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

// arktsid: exponent_nan_produces_nan
// description: If the exponent is NaN, the result of exponentiation is NaN for any base

function main(): void {
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY ** Number.NaN));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** Number.NaN));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** Number.NaN));
    arktest.assertTrue(Number.isNaN((-0.0) ** Number.NaN));
    arktest.assertTrue(Number.isNaN(0.0 ** Number.NaN));
    arktest.assertTrue(Number.isNaN(1.0e-15 ** Number.NaN));
    arktest.assertTrue(Number.isNaN(1.7976931348623157e308 ** Number.NaN));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY ** Number.NaN));
    arktest.assertTrue(Number.isNaN(Number.NaN ** Number.NaN));
}
