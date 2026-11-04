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

// arktsid: string_replace_escaped
// description: Do not replace $<> preceded with $ in named group replacement strings
// Conversion notes:
//  - Relies on GetSubstitution replacement semantics: $$ is escaped to a
//    literal $, and a $<name> group reference preceded by $ is not substituted.

function main(): void {
    let source: string = '(?<fst>.)';
    let flags: string[] = ['', 'u'];
    for (let f of flags) {
        let re: RegExp = new RegExp(source, f);
        arktest.assertEQ('$<fst>bc', 'abc'.replace(re, '$$<fst>'), 'flags=\'' + f + '\'');
    }
}