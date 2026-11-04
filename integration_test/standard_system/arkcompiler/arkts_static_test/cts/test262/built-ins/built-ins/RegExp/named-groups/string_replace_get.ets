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

// arktsid: string_replace_get
// description: Named substitutions are found by getting the property from the groups object
// Conversion notes:
//  - Relies on GetSubstitution replacement semantics: $<name> is resolved by
//    reading the named capture from the groups object. Global flag replaces
//    every match; non-global replaces only the first match.

function main(): void {
    let source: string = '(?<fst>.)(?<snd>.)|(?<thd>x)';

    let globalFlags: string[] = ['g', 'gu'];
    for (let f of globalFlags) {
        let re: RegExp = new RegExp(source, f);
        arktest.assertEQ('badc', 'abcd'.replace(re, '$<snd>$<fst>'), 'flags=\'' + f + '\'');
    }

    let nonGlobalFlags: string[] = ['', 'u'];
    for (let f of nonGlobalFlags) {
        let re: RegExp = new RegExp(source, f);
        arktest.assertEQ('bacd', 'abcd'.replace(re, '$<snd>$<fst>'), 'flags=\'' + f + '\'');
    }
}