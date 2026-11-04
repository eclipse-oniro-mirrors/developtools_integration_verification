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

// arktsid: regexp_modifier_syntax_err_other_code_point_g
// description: It is a Syntax Error if the source text matched by RegularExpressionFlags contains any code point other
// than i, m, or s. (arithmetic regular expression flags)
// Conversion notes: arithmetic modifier `(?-g:a)` removes flag "g", which is not
//   a valid option letter (only i/m/s). PCRE2 does not recognize "g" as an
//   option letter, so ArkTS RegExp native parse throws a runtime SyntaxError.

function main(): void {
    arktest.expectThrow(
        () => {
            new RegExp('(?-g:a)', '');
        },
        (e: Error) => {
            if (e.name === 'SyntaxError') { return true; }
            return 'Expected SyntaxError but got ' + e.name;
        }
    );
}