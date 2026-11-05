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

// arktsid: string_replace_unclosed
// description: A missing > following $< means that the $< is taken literally in a replacement string in the context of
// named capture substitution
// Conversion notes:
//  - a $< substitution with no closing '>' appends the literal '$<' and keeps the rest, per String.getSubstitution
//  - the 'g' flag repeats the same substitution for every match

function main(): void {
    let source: string = '(?<fst>.)(?<snd>.)|(?<thd>x)';

    let reNoFlags: RegExp = new RegExp(source, '');
    arktest.assertEQ('abcd'.replace(reNoFlags, '$<snd'), '$<sndcd',
        'no flags: unclosed $<snd is taken literally');

    let reUnicode: RegExp = new RegExp(source, 'u');
    arktest.assertEQ('abcd'.replace(reUnicode, '$<snd'), '$<sndcd',
        'unicode flag: unclosed $<snd is taken literally');

    let reGlobal: RegExp = new RegExp(source, 'g');
    arktest.assertEQ('abcd'.replace(reGlobal, '$<snd'), '$<snd$<snd',
        'global flag: unclosed $<snd repeats per match');

    let reGlobalUnicode: RegExp = new RegExp(source, 'gu');
    arktest.assertEQ('abcd'.replace(reGlobalUnicode, '$<snd'), '$<snd$<snd',
        'global+unicode flags: unclosed $<snd repeats per match');
}