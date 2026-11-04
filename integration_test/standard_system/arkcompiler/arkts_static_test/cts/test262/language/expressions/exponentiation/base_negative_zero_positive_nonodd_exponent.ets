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

// arktsid: base_negative_zero_positive_nonodd_exponent
// description: If base is -0 and exponent is a positive non-odd integer, the result is +0

function main(): void {
    arktest.assertPositiveZero((-0.0) ** 1.0e-15);
    arktest.assertPositiveZero((-0.0) ** 2.0);
    arktest.assertPositiveZero((-0.0) ** Math.PI);
    arktest.assertPositiveZero((-0.0) ** 1.7976931348623157e308);
    arktest.assertPositiveZero((-0.0) ** Number.POSITIVE_INFINITY);
}
