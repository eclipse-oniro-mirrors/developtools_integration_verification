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
// arktsid: bigint_valueof_returns_this
// description: BigInt.prototype.valueOf returns the primitive BigInt value
// Conversion notes: ArkTS BigInt has no prototype property; calling valueOf on the BigInt instance directly.

function main(): void {
    let b: BigInt = new BigInt('42');
    arktest.assertTrue(b.valueOf().equals(new BigInt('42')), 'valueOf returns the BigInt value');
    arktest.assertEQ(new BigInt('-7').valueOf().toString(), '-7');
    arktest.assertEQ(new BigInt('0').valueOf().toString(), '0');
}