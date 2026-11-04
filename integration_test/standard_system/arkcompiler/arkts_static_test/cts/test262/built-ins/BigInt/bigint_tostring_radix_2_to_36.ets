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

// arktsid: bigint_tostring_radix_2_to_36
// description: BigInt.toString supports radix 2 to 36
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    arktest.assertEQ(new BigInt('255').toString(16), 'ff', '255 radix 16');
    arktest.assertEQ(new BigInt('255').toString(2), '11111111', '255 radix 2');
    arktest.assertEQ(new BigInt('255').toString(8), '377', '255 radix 8');
    arktest.assertEQ(new BigInt('35').toString(36), 'z', '35 radix 36');
}