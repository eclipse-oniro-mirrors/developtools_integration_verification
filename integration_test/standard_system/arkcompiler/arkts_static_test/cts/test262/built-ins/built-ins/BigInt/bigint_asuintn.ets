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

// arktsid: bigint_asuintn
// description: BigInt.asUintN truncates BigInt to the given bit width (unsigned)

function main(): void {
    let n0n: BigInt = new BigInt('0');
    let n1n: BigInt = new BigInt('1');
    let n2n: BigInt = new BigInt('2');
    let nm1n: BigInt = new BigInt('-1');
    let nm2n: BigInt = new BigInt('-2');
    let nm3n: BigInt = new BigInt('-3');

    // 0 bits always returns 0n
    arktest.assertTrue(BigInt.asUintN(0, nm2n).equals(n0n));
    arktest.assertTrue(BigInt.asUintN(0, nm1n).equals(n0n));
    arktest.assertTrue(BigInt.asUintN(0, n0n).equals(n0n));
    arktest.assertTrue(BigInt.asUintN(0, n1n).equals(n0n));
    arktest.assertTrue(BigInt.asUintN(0, n2n).equals(n0n));

    // 1 bit: modulo 2, unsigned
    arktest.assertTrue(BigInt.asUintN(1, nm3n).equals(n1n));
    arktest.assertTrue(BigInt.asUintN(1, nm2n).equals(n0n));
    arktest.assertTrue(BigInt.asUintN(1, nm1n).equals(n1n));
    arktest.assertTrue(BigInt.asUintN(1, n0n).equals(n0n));
    arktest.assertTrue(BigInt.asUintN(1, n1n).equals(n1n));
    arktest.assertTrue(BigInt.asUintN(1, n2n).equals(n0n));
}