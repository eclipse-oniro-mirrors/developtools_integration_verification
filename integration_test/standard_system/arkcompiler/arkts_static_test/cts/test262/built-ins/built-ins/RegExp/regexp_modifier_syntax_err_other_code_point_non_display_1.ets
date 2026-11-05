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

// arktsid: regexp_modifier_syntax_err_other_code_point_non_display_1
// description: RegExp throws SyntaxError when an arithmetic modifier (s) is followed by a non-display code point
// Conversion notes: the pattern contains a non-display NUL (U+0000) code point after the removed "s" flag. ArkTS
// validates RegExp at runtime via native parse() in constructor.

function main(): void {
    let caught0: boolean = false;
    try {
        let r0 = new RegExp('(?-s\u0000:a)', '');
    } catch (e) {
        caught0 = true;
    }
    arktest.assertTrue(caught0, 'RegExp should throw SyntaxError');
}