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
// arktsid: bigint_tostring_letters_a_z
// description: BigInt.toString uses letters a-z for digit values 10 through 35
// Conversion notes: parameterized over radix 11-36 (representative values); ArkTS lowercases like test262.

function main(): void {
    arktest.assertEQ(new BigInt('10').toString(11), 'a', '10 radix 11');
    arktest.assertEQ(new BigInt('35').toString(36), 'z', '35 radix 36');
    arktest.assertEQ(new BigInt('20').toString(16), '14', '20 radix 16');
    arktest.assertEQ(new BigInt('65535').toString(16), 'ffff', '65535 radix 16');
    arktest.assertEQ(new BigInt('35').toString(17), '21', '35 radix 17');
}