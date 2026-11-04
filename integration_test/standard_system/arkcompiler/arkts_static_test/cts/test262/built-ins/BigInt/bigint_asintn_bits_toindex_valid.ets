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
// arktsid: bigint_asintn_bits_toindex_valid
// description: BigInt.asIntN/asUintN accepts valid non-negative bit counts (ToIndex subset)
// Conversion notes: negative/overflowing bits throw in test262 (ToIndex) but ArkTS returns modulo value — only valid
// non-negative bits migrated.

function main(): void {
    let n255: BigInt = new BigInt('255');
    let n0: BigInt = new BigInt('0');
    // valid bits
    arktest.assertEQ(BigInt.asIntN(8, n255).toString(), '-1', '255 asIntN 8');
    arktest.assertEQ(BigInt.asUintN(8, n255).toString(), '255', '255 asUintN 8');
    arktest.assertEQ(BigInt.asIntN(8, n0).toString(), '0', '0 asIntN 8');
    arktest.assertEQ(BigInt.asUintN(8, n0).toString(), '0', '0 asUintN 8');
    arktest.assertEQ(BigInt.asIntN(4, n255).toString(), '-1', '255 asIntN 4');
    arktest.assertEQ(BigInt.asUintN(4, n255).toString(), '15', '255 asUintN 4');
}