/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: regexp_modifier_syntax_err_other_code_point_combining_i
// description: RegExp rejects arithmetic modifier flags whose flags contain a code point other than i, m, or s
// Conversion notes: U+0365 (combining latin small letter i) is not an option letter, so the
//   RegExp constructor throws SyntaxError at runtime.

function main(): void {
    let caught: boolean = false;
    try {
        new RegExp('(?-iͥ:a)', '');
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'RegExp("(?-iͥ:a)", "") should throw SyntaxError');
}