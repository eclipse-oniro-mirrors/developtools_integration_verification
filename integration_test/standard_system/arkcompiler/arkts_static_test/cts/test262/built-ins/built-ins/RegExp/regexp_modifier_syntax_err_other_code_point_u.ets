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

// arktsid: regexp_modifier_syntax_err_other_code_point_u
// description: Arithmetic regexp modifier (?-u:a) with a non-flag code point u throws a SyntaxError
// Conversion notes: u is not a valid PCRE2 option letter (only i/m/s are), so (?-u:a) is rejected at RegExp
// construction
// Conversion notes: u is not a valid PCRE2 option letter (only i/m/s are), so (?-u:a) is rejected at RegExp
// construction
// with a runtime SyntaxError.

function main(): void {
    arktest.expectThrow((): void => {
        new RegExp('(?-u:a)', '');
    }, (e: Error): boolean => e.name === 'SyntaxError');
}