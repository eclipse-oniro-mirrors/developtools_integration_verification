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

// arktsid: regexp_modifier_syntax_err_other_code_point_combining_s
// description: RegExp("(?-s̀:a)") throws SyntaxError when a modifier flag is followed by a combining mark
// Conversion notes: the arithmetic modifier removes flag "s" but is followed by a
//   combining accent (U+0300), which PCRE2 does not recognize as an option
//   letter, so ArkTS RegExp native parse throws a runtime SyntaxError.

function main(): void {
    arktest.expectThrow(
        () => {
            new RegExp('(?-s̀:a)', '');
        },
        (e: Error) => {
            if (e.name === 'SyntaxError') { return true; }
            return 'Expected SyntaxError but got ' + e.name;
        }
    );
}