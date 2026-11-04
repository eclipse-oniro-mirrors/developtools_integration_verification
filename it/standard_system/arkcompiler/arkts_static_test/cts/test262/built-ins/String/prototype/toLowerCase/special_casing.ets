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
// arktsid: string_special_casing
// description: Check if String.prototype.toLowerCase supports mappings defined in SpecialCasings

function main(): void {
    arktest.assertEQ('\u00DF'.toLowerCase(), '\u00DF', 'LATIN SMALL LETTER SHARP S');
    arktest.assertEQ('\u0130'.toLowerCase(), '\u0069\u0307', 'LATIN CAPITAL LETTER I WITH DOT ABOVE');
    arktest.assertEQ('\uFB00'.toLowerCase(), '\uFB00', 'LATIN SMALL LIGATURE FF');
    arktest.assertEQ('\uFB01'.toLowerCase(), '\uFB01', 'LATIN SMALL LIGATURE FI');
    arktest.assertEQ('\uFB02'.toLowerCase(), '\uFB02', 'LATIN SMALL LIGATURE FL');
    arktest.assertEQ('\uFB03'.toLowerCase(), '\uFB03', 'LATIN SMALL LIGATURE FFI');
    arktest.assertEQ('\uFB04'.toLowerCase(), '\uFB04', 'LATIN SMALL LIGATURE FFL');
    arktest.assertEQ('\uFB05'.toLowerCase(), '\uFB05', 'LATIN SMALL LIGATURE LONG S T');
    arktest.assertEQ('\uFB06'.toLowerCase(), '\uFB06', 'LATIN SMALL LIGATURE ST');
    arktest.assertEQ('\u0587'.toLowerCase(), '\u0587', 'ARMENIAN SMALL LIGATURE ECH YIWN');
    arktest.assertEQ('\uFB13'.toLowerCase(), '\uFB13', 'ARMENIAN SMALL LIGATURE MEN NOW');
    arktest.assertEQ('\uFB14'.toLowerCase(), '\uFB14', 'ARMENIAN SMALL LIGATURE MEN ECH');
    arktest.assertEQ('\uFB15'.toLowerCase(), '\uFB15', 'ARMENIAN SMALL LIGATURE MEN INI');
    arktest.assertEQ('\uFB16'.toLowerCase(), '\uFB16', 'ARMENIAN SMALL LIGATURE VEW NOW');
    arktest.assertEQ('\uFB17'.toLowerCase(), '\uFB17', 'ARMENIAN SMALL LIGATURE MEN XEH');
    arktest.assertEQ('\u0149'.toLowerCase(), '\u0149', 'LATIN SMALL LETTER N PRECEDED BY APOSTROPHE');
    arktest.assertEQ('\u0390'.toLowerCase(), '\u0390', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS');
    arktest.assertEQ('\u03B0'.toLowerCase(), '\u03B0', 'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS');
    arktest.assertEQ('\u01F0'.toLowerCase(), '\u01F0', 'LATIN SMALL LETTER J WITH CARON');
    arktest.assertEQ('\u1E96'.toLowerCase(), '\u1E96', 'LATIN SMALL LETTER H WITH LINE BELOW');
    arktest.assertEQ('\u1E97'.toLowerCase(), '\u1E97', 'LATIN SMALL LETTER T WITH DIAERESIS');
    arktest.assertEQ('\u1E98'.toLowerCase(), '\u1E98', 'LATIN SMALL LETTER W WITH RING ABOVE');
    arktest.assertEQ('\u1E99'.toLowerCase(), '\u1E99', 'LATIN SMALL LETTER Y WITH RING ABOVE');
    arktest.assertEQ('\u1E9A'.toLowerCase(), '\u1E9A', 'LATIN SMALL LETTER A WITH RIGHT HALF RING');
    arktest.assertEQ('\u1F50'.toLowerCase(), '\u1F50', 'GREEK SMALL LETTER UPSILON WITH PSILI');
    arktest.assertEQ('\u1F52'.toLowerCase(), '\u1F52', 'GREEK SMALL LETTER UPSILON WITH PSILI AND VARIA');
    arktest.assertEQ('\u1F54'.toLowerCase(), '\u1F54', 'GREEK SMALL LETTER UPSILON WITH PSILI AND OXIA');
    arktest.assertEQ('\u1F56'.toLowerCase(), '\u1F56', 'GREEK SMALL LETTER UPSILON WITH PSILI AND PERISPOMENI');
    arktest.assertEQ('\u1FB6'.toLowerCase(), '\u1FB6', 'GREEK SMALL LETTER ALPHA WITH PERISPOMENI');
    arktest.assertEQ('\u1FC6'.toLowerCase(), '\u1FC6', 'GREEK SMALL LETTER ETA WITH PERISPOMENI');
    arktest.assertEQ('\u1FD2'.toLowerCase(), '\u1FD2', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND VARIA');
    arktest.assertEQ('\u1FD3'.toLowerCase(), '\u1FD3', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND OXIA');
    arktest.assertEQ('\u1FD6'.toLowerCase(), '\u1FD6', 'GREEK SMALL LETTER IOTA WITH PERISPOMENI');
    arktest.assertEQ('\u1FD7'.toLowerCase(), '\u1FD7', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND PERISPOMENI');
    arktest.assertEQ('\u1FE2'.toLowerCase(), '\u1FE2', 'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND VARIA');
    arktest.assertEQ('\u1FE3'.toLowerCase(), '\u1FE3', 'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND OXIA');
    arktest.assertEQ('\u1FE4'.toLowerCase(), '\u1FE4', 'GREEK SMALL LETTER RHO WITH PSILI');
    arktest.assertEQ('\u1FE6'.toLowerCase(), '\u1FE6', 'GREEK SMALL LETTER UPSILON WITH PERISPOMENI');
    arktest.assertEQ('\u1FE7'.toLowerCase(), '\u1FE7', 'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND PERISPOMENI');
    arktest.assertEQ('\u1FF6'.toLowerCase(), '\u1FF6', 'GREEK SMALL LETTER OMEGA WITH PERISPOMENI');
    arktest.assertEQ('\u1F80'.toLowerCase(), '\u1F80', 'GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F81'.toLowerCase(), '\u1F81', 'GREEK SMALL LETTER ALPHA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F82'.toLowerCase(), '\u1F82',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F83'.toLowerCase(), '\u1F83',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F84'.toLowerCase(), '\u1F84',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F85'.toLowerCase(), '\u1F85',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F86'.toLowerCase(), '\u1F86',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F87'.toLowerCase(), '\u1F87',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F88'.toLowerCase(), '\u1F80', 'GREEK CAPITAL LETTER ALPHA WITH PSILI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1F89'.toLowerCase(), '\u1F81', 'GREEK CAPITAL LETTER ALPHA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8A'.toLowerCase(), '\u1F82',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8B'.toLowerCase(), '\u1F83',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8C'.toLowerCase(), '\u1F84',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8D'.toLowerCase(), '\u1F85',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8E'.toLowerCase(), '\u1F86',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8F'.toLowerCase(), '\u1F87',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1F90'.toLowerCase(), '\u1F90', 'GREEK SMALL LETTER ETA WITH PSILI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F91'.toLowerCase(), '\u1F91', 'GREEK SMALL LETTER ETA WITH DASIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F92'.toLowerCase(), '\u1F92', 'GREEK SMALL LETTER ETA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F93'.toLowerCase(), '\u1F93', 'GREEK SMALL LETTER ETA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F94'.toLowerCase(), '\u1F94', 'GREEK SMALL LETTER ETA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F95'.toLowerCase(), '\u1F95', 'GREEK SMALL LETTER ETA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F96'.toLowerCase(), '\u1F96',
        'GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F97'.toLowerCase(), '\u1F97',
        'GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F98'.toLowerCase(), '\u1F90', 'GREEK CAPITAL LETTER ETA WITH PSILI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1F99'.toLowerCase(), '\u1F91', 'GREEK CAPITAL LETTER ETA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9A'.toLowerCase(), '\u1F92',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9B'.toLowerCase(), '\u1F93',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9C'.toLowerCase(), '\u1F94',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9D'.toLowerCase(), '\u1F95',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9E'.toLowerCase(), '\u1F96',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9F'.toLowerCase(), '\u1F97',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1FA0'.toLowerCase(), '\u1FA0', 'GREEK SMALL LETTER OMEGA WITH PSILI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FA1'.toLowerCase(), '\u1FA1', 'GREEK SMALL LETTER OMEGA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA2'.toLowerCase(), '\u1FA2',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA3'.toLowerCase(), '\u1FA3',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA4'.toLowerCase(), '\u1FA4',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA5'.toLowerCase(), '\u1FA5',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA6'.toLowerCase(), '\u1FA6',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA7'.toLowerCase(), '\u1FA7',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FA8'.toLowerCase(), '\u1FA0', 'GREEK CAPITAL LETTER OMEGA WITH PSILI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1FA9'.toLowerCase(), '\u1FA1', 'GREEK CAPITAL LETTER OMEGA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAA'.toLowerCase(), '\u1FA2',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAB'.toLowerCase(), '\u1FA3',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAC'.toLowerCase(), '\u1FA4',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAD'.toLowerCase(), '\u1FA5',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAE'.toLowerCase(), '\u1FA6',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAF'.toLowerCase(), '\u1FA7',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1FB3'.toLowerCase(), '\u1FB3', 'GREEK SMALL LETTER ALPHA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FBC'.toLowerCase(), '\u1FB3', 'GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FC3'.toLowerCase(), '\u1FC3', 'GREEK SMALL LETTER ETA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FCC'.toLowerCase(), '\u1FC3', 'GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FF3'.toLowerCase(), '\u1FF3', 'GREEK SMALL LETTER OMEGA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FFC'.toLowerCase(), '\u1FF3', 'GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FB2'.toLowerCase(), '\u1FB2', 'GREEK SMALL LETTER ALPHA WITH VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FB4'.toLowerCase(), '\u1FB4', 'GREEK SMALL LETTER ALPHA WITH OXIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FC2'.toLowerCase(), '\u1FC2', 'GREEK SMALL LETTER ETA WITH VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FC4'.toLowerCase(), '\u1FC4', 'GREEK SMALL LETTER ETA WITH OXIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FF2'.toLowerCase(), '\u1FF2', 'GREEK SMALL LETTER OMEGA WITH VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FF4'.toLowerCase(), '\u1FF4', 'GREEK SMALL LETTER OMEGA WITH OXIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FB7'.toLowerCase(), '\u1FB7', 'GREEK SMALL LETTER ALPHA WITH PERISPOMENI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FC7'.toLowerCase(), '\u1FC7', 'GREEK SMALL LETTER ETA WITH PERISPOMENI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FF7'.toLowerCase(), '\u1FF7', 'GREEK SMALL LETTER OMEGA WITH PERISPOMENI AND YPOGEGRAMMENI');
}