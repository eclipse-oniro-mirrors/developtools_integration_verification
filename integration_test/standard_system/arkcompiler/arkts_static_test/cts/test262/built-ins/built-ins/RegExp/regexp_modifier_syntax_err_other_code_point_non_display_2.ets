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

// arktsid: regexp_modifier_syntax_err_other_code_point_non_display_2
// description: Arithmetic modifier `(?-s<U+200E>:a)` puts a non-display code point (U+200E) right after the
// removed flag
// description: Arithmetic modifier `(?-s<U+200E>:a)` puts a non-display code point (U+200E) right after the
// removed flag
// s, which is a Syntax Error (only i, m, or s are allowed in RegularExpressionFlags)
// Conversion notes: PCRE2 does not recognize the non-display code point U+200E as an
//   option letter, so ArkTS RegExp native parse throws a runtime SyntaxError, matching
//   the JS early error. The non-display code point is written as the escape \u200E.

function main(): void {
    arktest.expectThrow((): void => {
        new RegExp('(?-s\u200E:a)', '');
    }, (e: Error): boolean => e.name === 'SyntaxError');
}