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
// arktsid: bigint_constructor_from_decimal_string
// description: BigInt constructor parses decimal strings including large values beyond 64-bit

function main(): void {
    arktest.assertEQ(new BigInt('18446744073709551616').toString(), '18446744073709551616');
    arktest.assertEQ(new BigInt('-18446744073709551616').toString(), '-18446744073709551616');
    arktest.assertEQ(new BigInt('10').toString(), '10');
    arktest.assertEQ(new BigInt('-10').toString(), '-10');
    arktest.assertEQ(new BigInt('7').toString(), '7');
}