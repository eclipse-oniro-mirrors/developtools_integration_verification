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

// arktsid: negative_finite_base_noninteger_exponent
// description: If base < 0 is finite and exponent is finite non-integer, the result is NaN

function main(): void {
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** (-Math.PI)));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** (-Math.E)));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** (-1.000000000000001)));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** (-1.0e-15)));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** 1.0e-15));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** 1.000000000000001));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** Math.E));
    arktest.assertTrue(Number.isNaN((-1.7976931348623157e308) ** Math.PI));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** (-Math.PI)));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** (-Math.E)));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** (-1.000000000000001)));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** (-1.0e-15)));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** 1.0e-15));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** 1.000000000000001));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** Math.E));
    arktest.assertTrue(Number.isNaN((-Math.PI) ** Math.PI));
    arktest.assertTrue(Number.isNaN((-1.0) ** (-Math.PI)));
    arktest.assertTrue(Number.isNaN((-1.0) ** (-Math.E)));
    arktest.assertTrue(Number.isNaN((-1.0) ** (-1.000000000000001)));
    arktest.assertTrue(Number.isNaN((-1.0) ** (-1.0e-15)));
    arktest.assertTrue(Number.isNaN((-1.0) ** 1.0e-15));
    arktest.assertTrue(Number.isNaN((-1.0) ** 1.000000000000001));
    arktest.assertTrue(Number.isNaN((-1.0) ** Math.E));
    arktest.assertTrue(Number.isNaN((-1.0) ** Math.PI));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** (-Math.PI)));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** (-Math.E)));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** (-1.000000000000001)));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** (-1.0e-15)));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** 1.0e-15));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** 1.000000000000001));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** Math.E));
    arktest.assertTrue(Number.isNaN((-1.0e-15) ** Math.PI));
}
