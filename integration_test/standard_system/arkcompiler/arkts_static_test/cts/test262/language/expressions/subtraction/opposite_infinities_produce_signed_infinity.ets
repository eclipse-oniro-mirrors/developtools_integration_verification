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

// arktsid: opposite_infinities_produce_signed_infinity
// description: Subtracting infinities with opposite signs preserves the minuend sign

function main(): void {
    arktest.assertEQ(Number.POSITIVE_INFINITY - Number.NEGATIVE_INFINITY, Number.POSITIVE_INFINITY);
    arktest.assertEQ(Number.NEGATIVE_INFINITY - Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY);
}
