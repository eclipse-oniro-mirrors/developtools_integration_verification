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
// arktsid: string_towellformed_returns_well_formed_string
// description: String.prototype.toWellFormed returns a well-formed string (lone surrogates replaced with U+FFFD, valid
// pairs kept)
// Conversion notes: test262 returns-well-formed-string.js — ArkTS stdlib toWellFormed follows the same CodePointAt
// algorithm; lone surrogates are built via String.fromCharCode since ArkTS string literals are UTF-16

function main(): void {
    let replacementChar: string = String.fromCharCode(0xFFFD);
    let leadingPoo: string = '\uD83D';
    let trailingPoo: string = '\uDCA9';
    let wholePoo: string = leadingPoo + trailingPoo;

        arktest.assertEQ(('a' + leadingPoo + 'c' + leadingPoo + 'e').toWellFormed(),
            'a' + replacementChar + 'c' + replacementChar + 'e',
        
        'lone leading surrogates are replaced with the expected replacement character');
        arktest.assertEQ(('a' + trailingPoo + 'c' + trailingPoo + 'e').toWellFormed(),
            'a' + replacementChar + 'c' + replacementChar + 'e',
        
        'lone trailing surrogates are replaced with the expected replacement character');
        arktest.assertEQ(('a' + trailingPoo + leadingPoo + 'd').toWellFormed(),
            'a' + replacementChar + replacementChar + 'd',
        
        'a wrong-ordered surrogate pair is replaced with two replacement characters');
    arktest.assertEQ('a💩c'.toWellFormed(), 'a💩c',
        'a surrogate pair using a literal code point is already well-formed');
    arktest.assertEQ('a💩c'.toWellFormed(), 'a💩c',
        'a surrogate pair formed by escape sequences is already well-formed');
    arktest.assertEQ(('a' + leadingPoo + trailingPoo + 'd').toWellFormed(), 'a' + wholePoo + 'd',
        'a surrogate pair formed by concatenation is already well-formed');
    arktest.assertEQ(wholePoo.slice(0, 1).toWellFormed(), replacementChar,
        'a surrogate pair sliced to the leading surrogate is replaced with the expected replacement character');
    arktest.assertEQ(wholePoo.slice(1).toWellFormed(), replacementChar,
        'a surrogate pair sliced to the trailing surrogate is replaced with the expected replacement character');
    arktest.assertEQ('abc'.toWellFormed(), 'abc', 'a latin-1 string is already well-formed');
    arktest.assertEQ('a▨c'.toWellFormed(), 'a▨c', 'a string with a non-ASCII character is already well-formed');
}