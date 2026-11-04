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
// arktsid: bigint_constructor_integer_long
// description: BigInt constructor accepts long integer arguments (exact value preserved)
// Conversion notes: Number.MAX_SAFE_INTEGER family becomes long literals; double integer values also exact.

function main(): void {
    arktest.assertEQ(new BigInt(9007199254740991 as long).toString(), '9007199254740991');
    arktest.assertEQ(new BigInt(-9007199254740991 as long).toString(), '-9007199254740991');
    arktest.assertEQ(new BigInt(9007199254740992 as long).toString(), '9007199254740992');
    arktest.assertEQ(new BigInt(-9007199254740992 as long).toString(), '-9007199254740992');
    arktest.assertEQ(new BigInt(9007199254740992.0).toString(), '9007199254740992', 'double integer exact');
    arktest.assertEQ(new BigInt(123 as long).toString(), '123');
}