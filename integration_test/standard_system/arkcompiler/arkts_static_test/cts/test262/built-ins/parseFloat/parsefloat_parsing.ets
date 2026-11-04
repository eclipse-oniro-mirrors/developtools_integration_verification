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

// arktsid: parsefloat_parsing
// description: parseFloat parses the longest valid prefix and ignores trailing non-numeric characters
// Migrated from test262: built-ins/parseFloat/S15.1.2.3_A4_T1.js

function main(): void {
    // Standard float parsing
    arktest.assertEQ(parseFloat('1.1'), 1.1);

    // Longest prefix: stops at first invalid character
    arktest.assertEQ(parseFloat('0x'), 0.0);     // '0' is valid prefix
    arktest.assertEQ(parseFloat('11x'), 11.0);   // '11' is valid prefix
    arktest.assertEQ(parseFloat('11s1'), 11.0);  // '11' is valid prefix

    // Decimals with trailing junk
    arktest.assertEQ(parseFloat('11.s1'), 11.0); // '11.' → 11
    arktest.assertEQ(parseFloat('.0s1'), 0.0);   // '.0' → 0
    arktest.assertEQ(parseFloat('1.s1'), 1.0);   // '1.' → 1
}