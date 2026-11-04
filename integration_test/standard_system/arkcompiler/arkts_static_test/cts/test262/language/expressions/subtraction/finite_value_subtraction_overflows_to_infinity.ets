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

// arktsid: finite_value_subtraction_overflows_to_infinity
// description: Subtraction overflow produces an infinity with the appropriate sign

function main(): void {
    arktest.assertEQ(Number.MAX_VALUE - -Number.MAX_VALUE, Number.POSITIVE_INFINITY);
    arktest.assertEQ(-Number.MAX_VALUE - Number.MAX_VALUE, Number.NEGATIVE_INFINITY);
    arktest.assertEQ(1e308 - -1e308, Number.POSITIVE_INFINITY);
    arktest.assertEQ(-8.99e307 - 8.99e307, Number.NEGATIVE_INFINITY);
}
