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

// arktsid: infinite_dividend_produces_nan
// description: An infinite dividend makes remainder produce NaN

function main(): void {
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY % Number.POSITIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY % Number.NEGATIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY % Number.POSITIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY % Number.NEGATIVE_INFINITY));
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY % 1.0));
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY % -1.0));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY % 1.0));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY % -1.0));
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY % Number.MAX_VALUE));
    arktest.assertTrue(Number.isNaN(Number.NEGATIVE_INFINITY % -Number.MAX_VALUE));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY % Number.MAX_VALUE));
    arktest.assertTrue(Number.isNaN(Number.POSITIVE_INFINITY % -Number.MAX_VALUE));
}
