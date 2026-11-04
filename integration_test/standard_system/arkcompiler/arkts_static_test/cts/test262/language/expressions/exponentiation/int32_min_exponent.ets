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

// arktsid: int32_min_exponent
// description: Using -(2**31) as exponent with the exponentiation operator should behave as expected

function main(): void {
    // 2**-(huge exponent > 1074) should be +0 because 2**-1074 is the smallest positive IEEE-754 number
    arktest.assertPositiveZero(2 ** -2147483648);
    // 1**-(huge exponent > 1074) should be 1
    arktest.assertEQ(1 ** -2147483648, 1);
}
