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

// arktsid: string_replace_nocaptures
// description: If there are no named captures, don't replace $<>
// Conversion notes:
//  - With namedCaptures undefined, GetSubstitution appends the literal '$<' and
//    reparses the rest of the replacement text normally (numbered $2$1 still work).

function main(): void {
    let source: String = '(.)(.)|(x)';
    let flagsList: String[] = ['', 'u'];
    for (let flags of flagsList) {
        let re: RegExp = new RegExp(source, flags);
        arktest.assertEQ('abcd'.replace(re, '$<snd>$<fst>'), '$<snd>$<fst>cd', flags + ': $<snd>$<fst> literal');
        arktest.assertEQ('abcd'.replace(re, '$2$1'), 'bacd', flags + ': $2$1 numbered');
        arktest.assertEQ('abcd'.replace(re, '$3'), 'cd', flags + ': $3 unmatched group empty');
        arktest.assertEQ('abcd'.replace(re, '$<snd'), '$<sndcd', flags + ': $<snd unclosed literal');
        arktest.assertEQ('abcd'.replace(re, '$<snd$1'), '$<sndacd', flags + ': $<snd$1 mixed');
        arktest.assertEQ('abcd'.replace(re, '$<42$1>'), '$<42a>cd', flags + ': $<42$1> literal + $1');
        arktest.assertEQ('abcd'.replace(re, '$<fth>'), '$<fth>cd', flags + ': $<fth> literal');
        arktest.assertEQ('abcd'.replace(re, '$<$1>'), '$<a>cd', flags + ': $<$1> literal + $1');
    }
}