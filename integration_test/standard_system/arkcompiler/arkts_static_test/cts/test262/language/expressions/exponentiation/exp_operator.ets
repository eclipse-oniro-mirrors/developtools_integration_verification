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

// arktsid: exp_operator
// description: Performs exponential calculation on operands. Same algorithm as %MathPow%(base, exponent)

function main(): void {
    let exponent: int = 2;
    arktest.assertEQ(2 ** 3, 8);
    arktest.assertEQ(3 * 2 ** 3, 24);
    arktest.assertEQ(2 ** ++exponent, 8);
    arktest.assertEQ(2 ** -1 * 2, 1);
    arktest.assertEQ(2 ** 2 * 4, 16);
    arktest.assertEQ(2 ** 2 / 2, 2);
    arktest.assertEQ(2 ** (3 ** 2), 512);
    arktest.assertEQ(2 ** 3 ** 2, 512);
    arktest.assertEQ(16 / 2 ** 2, 4);
}
