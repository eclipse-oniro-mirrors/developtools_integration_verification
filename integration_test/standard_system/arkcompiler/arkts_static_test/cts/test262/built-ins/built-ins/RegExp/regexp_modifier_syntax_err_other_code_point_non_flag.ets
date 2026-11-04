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
// arktsid: regexp_modifier_syntax_err_other_code_point_non_flag
// description: Syntax Error when an arithmetic modifier flag is a code point other than i, m, or s
// Conversion notes:
//  - PCRE2 does not recognize 'Q' as an option letter, so (?-Q:a) throws a runtime SyntaxError.

function main(): void {
    arktest.expectThrow((): void => {
        new RegExp('(?-Q:a)', '');
    }, (e: Error): boolean => e.name === 'SyntaxError');
}