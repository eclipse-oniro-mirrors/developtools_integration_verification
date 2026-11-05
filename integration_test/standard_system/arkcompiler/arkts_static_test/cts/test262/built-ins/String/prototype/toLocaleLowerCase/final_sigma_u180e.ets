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

// arktsid: string_final_sigma_u180e
// description: Check if String.prototype.toLocaleLowerCase supports conditional mappings defined in
// SpecialCasings, test
// description: Check if String.prototype.toLocaleLowerCase supports conditional mappings defined in
// SpecialCasings, test
// Final_Sigma context with Mongolian Vowel Separator

function main(): void {
    // Sigma preceded by Mongolian Vowel Separator.
        arktest.assertEQ('\u0041\u180E\u03A3'.toLocaleLowerCase(), '\u0061\u180E\u03C2',
        'Sigma preceded by LATIN CAPITAL LETTER A, MONGOLIAN VOWEL SEPARATOR');
        arktest.assertEQ('\u0041\u180E\u03A3\u0042'.toLocaleLowerCase(), '\u0061\u180E\u03C3\u0062',
        'Sigma preceded by LATIN CAPITAL LETTER A, MONGOLIAN VOWEL SEPARATOR, followed by LATIN CAPITAL LETTER B');
    // Sigma followed by Mongolian Vowel Separator.
        arktest.assertEQ('\u0041\u03A3\u180E'.toLocaleLowerCase(), '\u0061\u03C2\u180E',
        'Sigma preceded by LATIN CAPITAL LETTER A, followed by MONGOLIAN VOWEL SEPARATOR');
        arktest.assertEQ('\u0041\u03A3\u180E\u0042'.toLocaleLowerCase(), '\u0061\u03C3\u180E\u0062',
        'Sigma preceded by LATIN CAPITAL LETTER A, followed by MONGOLIAN VOWEL SEPARATOR, LATIN CAPITAL LETTER B');
    // Sigma preceded and followed by Mongolian Vowel Separator.
        arktest.assertEQ('\u0041\u180E\u03A3\u180E'.toLocaleLowerCase(), '\u0061\u180E\u03C2\u180E',
        'Sigma preceded by LATIN CAPITAL LETTER A, MONGOLIAN VOWEL SEPARATOR, followed by MONGOLIAN VOWEL SEPARATOR');
        arktest.assertEQ('\u0041\u180E\u03A3\u180E\u0042'.toLocaleLowerCase(), '\u0061\u180E\u03C3\u180E\u0062',
        'Sigma preceded by LATIN CAPITAL LETTER A, MONGOLIAN VOWEL SEPARATOR, followed by MONGOLIAN VOWEL' +
        ' SEPARATOR, LATIN CAPITAL LETTER B');
}