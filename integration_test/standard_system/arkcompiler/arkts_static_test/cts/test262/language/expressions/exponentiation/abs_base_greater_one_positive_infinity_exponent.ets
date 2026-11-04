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

// arktsid: abs_base_greater_one_positive_infinity_exponent
// description: If |base| > 1 and exponent is +Infinity, the result is +Infinity

function main(): void {
    arktest.assertTrue(Number.NEGATIVE_INFINITY ** Number.POSITIVE_INFINITY === Number.POSITIVE_INFINITY);
    arktest.assertTrue((-1.7976931348623157e308) ** Number.POSITIVE_INFINITY === Number.POSITIVE_INFINITY);
    arktest.assertTrue((-1.000000000000001) ** Number.POSITIVE_INFINITY === Number.POSITIVE_INFINITY);
    arktest.assertTrue(1.000000000000001 ** Number.POSITIVE_INFINITY === Number.POSITIVE_INFINITY);
    arktest.assertTrue(1.7976931348623157e308 ** Number.POSITIVE_INFINITY === Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.POSITIVE_INFINITY ** Number.POSITIVE_INFINITY === Number.POSITIVE_INFINITY);
}
