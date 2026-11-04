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

// arktsid: bigint_constructor_octal
// description: BigInt constructor parses octal strings (0o/0O prefix)

function main(): void {
    arktest.assertTrue(new BigInt('0o7').equals(new BigInt('7')));
    arktest.assertTrue(new BigInt('0o10').equals(new BigInt('8')));
    arktest.assertTrue(new BigInt('0o20').equals(new BigInt('16')));

    // Uppercase 0O prefix
    arktest.assertTrue(new BigInt('0O7').equals(new BigInt('7')));
    arktest.assertTrue(new BigInt('0O10').equals(new BigInt('8')));
    arktest.assertTrue(new BigInt('0O20').equals(new BigInt('16')));
}