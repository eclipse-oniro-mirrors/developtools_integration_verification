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

// arktsid: regexp_modifier_syntax_err_other_code_point_combining_m
// description: It is a Syntax Error if the source text matched by RegularExpressionFlags contains any code point other
// than i, m, or s, or if it contains the same code point more than once (arithmetic regular expression flags)
// Conversion notes: the modifier "m" is followed by U+036B (COMBINING LATIN SMALL LETTER M), which is neither i/m/s nor
// a duplicate, so PCRE2 rejects the pattern and the ArkTS RegExp constructor throws a runtime SyntaxError.

function main(): void {
    let caught: boolean = false;
    try {
        new RegExp('(?-mͫ:a)', '');
    } catch (e) {
        caught = e.name === 'SyntaxError';
    }
    arktest.assertTrue(caught, 'RegExp("(?-mͫ:a)", "") should throw SyntaxError');
}