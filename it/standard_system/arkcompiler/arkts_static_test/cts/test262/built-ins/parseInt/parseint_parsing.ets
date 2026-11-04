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

// arktsid: parseint_parsing
// description: parseInt parses integer strings with optional radix; stops at first non-digit
// Migrated from test262: built-ins/parseInt S15.1.2.2_A6.1_T1.js and related

function main(): void {
    // Basic decimal parsing
    arktest.assertEQ(parseInt('42'), 42);
    arktest.assertEQ(parseInt('-42'), -42);

    // Longest prefix: stops at first non-digit
    arktest.assertEQ(parseInt('10$1', 10), 10);

    // Hex parsing with 0x prefix
    arktest.assertEQ(parseInt('0xA'), 10);
    arktest.assertEQ(parseInt('0xFF'), 255);

    // Radix 16 explicit
    arktest.assertEQ(parseInt('A', 16), 10);
    arktest.assertEQ(parseInt('FF', 16), 255);

    // Radix 2 (binary)
    arktest.assertEQ(parseInt('1010', 2), 10);

    // Radix 8 (octal)
    arktest.assertEQ(parseInt('17', 8), 15);

    // Invalid radix character stops parsing
    arktest.assertEQ(Number.isNaN(parseInt('$string', 10)), true);
}