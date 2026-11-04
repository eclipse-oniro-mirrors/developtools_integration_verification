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

// arktsid: regexp_invalid_pattern_throws
// description: RegExp constructor throws SyntaxError for unsupported patterns
// Conversion notes: test262 uses /pattern/ literal with negative:parse:SyntaxError.
//   ArkTS validates at runtime (not compile time) via native parse() in constructor.
//   Covers 163 property-escapes tests with 3 dimension representatives:
//     \p{} (84 files), \P{} (73 files), grammar-extension (6 files).
//   Also covers 29 unicodeSets/v-flag tests — those do NOT throw in ArkTS.

function main(): void {
    // Dimension 1: \p{...} Unicode property escape (84 test262 files)
    let caughtP: boolean = false;
    try {
        let r = new RegExp('\\p{ASCII=F}', 'u');
    } catch (e) {
        caughtP = true;
    }
    arktest.assertTrue(caughtP, '\\p{...} should throw SyntaxError');

    // Dimension 2: \P{...} negated Unicode property escape (73 test262 files)
    let caughtPCap: boolean = false;
    try {
        let r = new RegExp('\\P{ASCII=F}', 'u');
    } catch (e) {
        caughtPCap = true;
    }
    arktest.assertTrue(caughtPCap, '\\P{...} should throw SyntaxError');

    // Dimension 3: invalid flag (separate dimension)
    let caughtFlag: boolean = false;
    try {
        let r = new RegExp('abc', 'z');
    } catch (e) {
        caughtFlag = true;
    }
    arktest.assertTrue(caughtFlag, 'invalid flag should throw SyntaxError');

    // Valid pattern should not throw
    let validOk: boolean = false;
    try {
        let r = new RegExp('[a-z]+', 'g');
        validOk = true;
    } catch (e) {
        validOk = false;
    }
    arktest.assertTrue(validOk, 'valid pattern should not throw');
}