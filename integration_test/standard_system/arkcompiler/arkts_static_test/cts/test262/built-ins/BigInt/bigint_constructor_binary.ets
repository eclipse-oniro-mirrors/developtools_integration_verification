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

// arktsid: bigint_constructor_binary
// description: BigInt constructor parses binary strings (0b/0B prefix)

function main(): void {
    arktest.assertTrue(new BigInt('0b1111').equals(new BigInt('15')));
    arktest.assertTrue(new BigInt('0b10').equals(new BigInt('2')));
    arktest.assertTrue(new BigInt('0b0').equals(new BigInt('0')));
    arktest.assertTrue(new BigInt('0b1').equals(new BigInt('1')));

    // Uppercase 0B prefix
    arktest.assertTrue(new BigInt('0B1111').equals(new BigInt('15')));
    arktest.assertTrue(new BigInt('0B10').equals(new BigInt('2')));
    arktest.assertTrue(new BigInt('0B0').equals(new BigInt('0')));
    arktest.assertTrue(new BigInt('0B1').equals(new BigInt('1')));
}