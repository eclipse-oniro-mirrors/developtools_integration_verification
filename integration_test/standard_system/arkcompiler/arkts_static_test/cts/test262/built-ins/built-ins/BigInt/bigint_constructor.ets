/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: bigint_constructor
// description: BigInt constructor from decimal, hex, binary, and octal strings

function main(): void {
    // Decimal strings
    let d1 = new BigInt('10');
    arktest.assertTrue(d1.equals(new BigInt('10')));
    arktest.assertEQ(d1.toString(), '10');

    let d2 = new BigInt('-7');
    arktest.assertEQ(d2.toString(), '-7');

    // Hex strings (0x prefix)
    let h1 = new BigInt('0xff');
    arktest.assertEQ(h1.toString(), '255');

    let h2 = new BigInt('0x10');
    arktest.assertEQ(h2.toString(), '16');

    // Large number
    let big = new BigInt('18446744073709551616');
    arktest.assertEQ(big.toString(), '18446744073709551616');
}