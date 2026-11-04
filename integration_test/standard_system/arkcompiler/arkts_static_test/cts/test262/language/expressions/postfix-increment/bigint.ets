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

// arktsid: bigint
// description: Postfix increment for references to BigInt values: returns the old value and increments by one
// Conversion notes: source hex bigint literals are written as their decimal equivalents (ArkTS accepts only decimal
// bigint literals)

function main(): void {
    let x: bigint = 0n;
    arktest.assertEQ(x++, 0n);
    arktest.assertEQ(x, 1n);

    let x2: bigint = -1n;
    arktest.assertEQ(x2++, -1n);
    arktest.assertEQ(x2, 0n);

    let x3: bigint = 123456n;
    arktest.assertEQ(x3++, 123456n);
    arktest.assertEQ(x3, 123457n);

    let x4: bigint = -123457n;
    arktest.assertEQ(x4++, -123457n);
    arktest.assertEQ(x4, -123456n);

    let x5: bigint = 2305843009213693696n;
    arktest.assertEQ(x5++, 2305843009213693696n);
    arktest.assertEQ(x5, 2305843009213693697n);

    let x6: bigint = -2305843009213693697n;
    arktest.assertEQ(x6++, -2305843009213693697n);
    arktest.assertEQ(x6, -2305843009213693696n);
}