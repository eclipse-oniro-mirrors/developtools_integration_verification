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

// arktsid: string_special_casing_conditional
// description: Check if String.prototype.toLocaleLowerCase supports conditional mappings defined in SpecialCasings
// (Final_Sigma context)

function main(): void {
    arktest.assertEQ('\u03A3'.toLocaleLowerCase(), '\u03C3', 'Single GREEK CAPITAL LETTER SIGMA');
    // Sigma preceded by Cased and zero or more Case_Ignorable.
    arktest.assertEQ('\u0041\u03A3'.toLocaleLowerCase(), '\u0061\u03C2', 'Sigma preceded by LATIN CAPITAL LETTER A');
        arktest.assertEQ('\uD835\uDCA2\u03A3'.toLocaleLowerCase(), '\uD835\uDCA2\u03C2',
        'Sigma preceded by MATHEMATICAL SCRIPT CAPITAL G (1D4A2)');
    arktest.assertEQ('\u0041\u002E\u03A3'.toLocaleLowerCase(), '\u0061\u002E\u03C2', 'Sigma preceded by FULL STOP');
        arktest.assertEQ('\u0041\u00AD\u03A3'.toLocaleLowerCase(), '\u0061\u00AD\u03C2',
        'Sigma preceded by SOFT HYPHEN (00AD)');
        arktest.assertEQ('\u0041\uD834\uDE42\u03A3'.toLocaleLowerCase(), '\u0061\uD834\uDE42\u03C2',
        'Sigma preceded by COMBINING GREEK MUSICAL TRISEME (1D242)');
        arktest.assertEQ('\u0345\u03A3'.toLocaleLowerCase(), '\u0345\u03C3',
        'Sigma preceded by COMBINING GREEK YPOGEGRAMMENI (0345)');
        arktest.assertEQ('\u0391\u0345\u03A3'.toLocaleLowerCase(), '\u03B1\u0345\u03C2',
        'Sigma preceded by GREEK CAPITAL LETTER ALPHA (0391), COMBINING GREEK YPOGEGRAMMENI (0345)');
    // Sigma not followed by zero or more Case_Ignorable and then Cased.
        arktest.assertEQ('\u0041\u03A3\u0042'.toLocaleLowerCase(), '\u0061\u03C3\u0062',
        'Sigma followed by LATIN CAPITAL LETTER B');
        arktest.assertEQ('\u0041\u03A3\uD835\uDCA2'.toLocaleLowerCase(), '\u0061\u03C3\uD835\uDCA2',
        'Sigma followed by MATHEMATICAL SCRIPT CAPITAL G (1D4A2)');
        arktest.assertEQ('\u0041\u03A3\u002E\u0062'.toLocaleLowerCase(), '\u0061\u03C3\u002E\u0062',
        'Sigma followed by FULL STOP');
        arktest.assertEQ('\u0041\u03A3\u00AD\u0042'.toLocaleLowerCase(), '\u0061\u03C3\u00AD\u0062',
        'Sigma followed by SOFT HYPHEN (00AD)');
        arktest.assertEQ('\u0041\u03A3\uD834\uDE42\u0042'.toLocaleLowerCase(), '\u0061\u03C3\uD834\uDE42\u0062',
        'Sigma followed by COMBINING GREEK MUSICAL TRISEME (1D242)');
        arktest.assertEQ('\u0041\u03A3\u0345'.toLocaleLowerCase(), '\u0061\u03C2\u0345',
        'Sigma followed by COMBINING GREEK YPOGEGRAMMENI (0345)');
        arktest.assertEQ('\u0041\u03A3\u0345\u0391'.toLocaleLowerCase(), '\u0061\u03C3\u0345\u03B1',
        'Sigma followed by COMBINING GREEK YPOGEGRAMMENI (0345), GREEK CAPITAL LETTER ALPHA (0391)');
}