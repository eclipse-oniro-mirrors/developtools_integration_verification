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

// arktsid: remainder_sign_and_signed_zero_rules
// description: Remainder keeps the dividend sign, including signed zero

function main(): void {
    arktest.assertPositiveZero(1.0 % 1.0);
    arktest.assertNegativeZero(-1.0 % -1.0);
    arktest.assertNegativeZero(-1.0 % 1.0);
    arktest.assertPositiveZero(1.0 % -1.0);
    arktest.assertEQ(101.0 % 51.0, 50.0);
    arktest.assertEQ(101.0 % -51.0, 50.0);
    arktest.assertEQ(-101.0 % 51.0, -50.0);
    arktest.assertEQ(-101.0 % -51.0, -50.0);
}
