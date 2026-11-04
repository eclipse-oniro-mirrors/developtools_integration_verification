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

// arktsid: abs_base_greater_one_negative_infinity_exponent
// description: If |base| > 1 and exponent is -Infinity, the result is +0

function main(): void {
    arktest.assertPositiveZero(Number.NEGATIVE_INFINITY ** Number.NEGATIVE_INFINITY);
    arktest.assertPositiveZero((-1.7976931348623157e308) ** Number.NEGATIVE_INFINITY);
    arktest.assertPositiveZero((-1.000000000000001) ** Number.NEGATIVE_INFINITY);
    arktest.assertPositiveZero(1.000000000000001 ** Number.NEGATIVE_INFINITY);
    arktest.assertPositiveZero(1.7976931348623157e308 ** Number.NEGATIVE_INFINITY);
    arktest.assertPositiveZero(Number.POSITIVE_INFINITY ** Number.NEGATIVE_INFINITY);
}
