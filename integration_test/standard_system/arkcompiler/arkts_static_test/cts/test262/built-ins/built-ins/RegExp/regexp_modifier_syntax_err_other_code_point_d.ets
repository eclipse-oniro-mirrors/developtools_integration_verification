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

// arktsid: regexp_modifier_syntax_err_other_code_point_d
// description: It is a Syntax Error if the source text matched by RegularExpressionFlags contains any code point other
// than i, m, or s, or if it contains the same code point more than once. (arithmetic regular expression flags)
// Conversion notes: 非法算术修饰符 (?-d:a) 中 d 非修饰符 flag（仅 i/m/s），PCRE2 不识别 d 为 option letter，运行时抛 SyntaxError。

function main(): void {
    arktest.expectThrow(
        () => {
            new RegExp('(?-d:a)', '');
        },
        (e: Error) => {
            if (e.name === 'SyntaxError') { return true; }
            return 'Expected SyntaxError but got ' + e.name;
        }
    );
}