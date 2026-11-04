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
// arktsid: toLowerCase_final_sigma_u180e
// description: String.prototype.toLowerCase applies Final_Sigma conditional casing with U+180E Mongolian Vowel
// Separator
// description: String.prototype.toLowerCase applies Final_Sigma conditional casing with U+180E Mongolian Vowel
// Separator
// Conversion notes: Runtime-probed on ArkTS 1.2: all six U+180E Final_Sigma contexts produce the expected results.

function main(): void {
    arktest.assertEQ('A\u180E\u03A3'.toLowerCase(), 'a\u180E\u03C2', 'Sigma preceded by A and U+180E is final');
    arktest.assertEQ('A\u180E\u03A3B'.toLowerCase(), 'a\u180E\u03C3b', 'Sigma preceded by A, U+180E, then B is medial');
        arktest.assertEQ('A\u03A3\u180E'.toLowerCase(), 'a\u03C2\u180E',
        'Sigma preceded by A, followed by U+180E is final');
        arktest.assertEQ('A\u03A3\u180EB'.toLowerCase(), 'a\u03C3\u180Eb',
        'Sigma preceded by A, followed by U+180E and B is medial');
    arktest.assertEQ('A\u180E\u03A3\u180E'.toLowerCase(), 'a\u180E\u03C2\u180E', 'Sigma surrounded by U+180E is final');
        arktest.assertEQ('A\u180E\u03A3\u180EB'.toLowerCase(), 'a\u180E\u03C3\u180Eb',
        'Sigma surrounded by U+180E, then B is medial');
}