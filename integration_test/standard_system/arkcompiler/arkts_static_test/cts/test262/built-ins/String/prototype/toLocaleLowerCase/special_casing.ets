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
// description: Check if String.prototype.toLocaleLowerCase supports mappings defined in SpecialCasings

function main(): void {
    arktest.assertEQ('\u00DF'.toLocaleLowerCase(), '\u00DF', 'LATIN SMALL LETTER SHARP S');
    arktest.assertEQ('\uFB00'.toLocaleLowerCase(), '\uFB00', 'LATIN SMALL LIGATURE FF');
    arktest.assertEQ('\uFB01'.toLocaleLowerCase(), '\uFB01', 'LATIN SMALL LIGATURE FI');
    arktest.assertEQ('\uFB02'.toLocaleLowerCase(), '\uFB02', 'LATIN SMALL LIGATURE FL');
    arktest.assertEQ('\uFB03'.toLocaleLowerCase(), '\uFB03', 'LATIN SMALL LIGATURE FFI');
    arktest.assertEQ('\uFB04'.toLocaleLowerCase(), '\uFB04', 'LATIN SMALL LIGATURE FFL');
    arktest.assertEQ('\uFB05'.toLocaleLowerCase(), '\uFB05', 'LATIN SMALL LIGATURE LONG S T');
    arktest.assertEQ('\uFB06'.toLocaleLowerCase(), '\uFB06', 'LATIN SMALL LIGATURE ST');
    arktest.assertEQ('\u0587'.toLocaleLowerCase(), '\u0587', 'ARMENIAN SMALL LIGATURE ECH YIWN');
    arktest.assertEQ('\uFB13'.toLocaleLowerCase(), '\uFB13', 'ARMENIAN SMALL LIGATURE MEN NOW');
    arktest.assertEQ('\uFB14'.toLocaleLowerCase(), '\uFB14', 'ARMENIAN SMALL LIGATURE MEN ECH');
    arktest.assertEQ('\uFB15'.toLocaleLowerCase(), '\uFB15', 'ARMENIAN SMALL LIGATURE MEN INI');
    arktest.assertEQ('\uFB16'.toLocaleLowerCase(), '\uFB16', 'ARMENIAN SMALL LIGATURE VEW NOW');
    arktest.assertEQ('\uFB17'.toLocaleLowerCase(), '\uFB17', 'ARMENIAN SMALL LIGATURE MEN XEH');
    arktest.assertEQ('\u0149'.toLocaleLowerCase(), '\u0149', 'LATIN SMALL LETTER N PRECEDED BY APOSTROPHE');
    arktest.assertEQ('\u0390'.toLocaleLowerCase(), '\u0390', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS');
    arktest.assertEQ('\u03B0'.toLocaleLowerCase(), '\u03B0', 'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS');
    arktest.assertEQ('\u01F0'.toLocaleLowerCase(), '\u01F0', 'LATIN SMALL LETTER J WITH CARON');
    arktest.assertEQ('\u1E96'.toLocaleLowerCase(), '\u1E96', 'LATIN SMALL LETTER H WITH LINE BELOW');
    arktest.assertEQ('\u1E97'.toLocaleLowerCase(), '\u1E97', 'LATIN SMALL LETTER T WITH DIAERESIS');
    arktest.assertEQ('\u1E98'.toLocaleLowerCase(), '\u1E98', 'LATIN SMALL LETTER W WITH RING ABOVE');
    arktest.assertEQ('\u1E99'.toLocaleLowerCase(), '\u1E99', 'LATIN SMALL LETTER Y WITH RING ABOVE');
    arktest.assertEQ('\u1E9A'.toLocaleLowerCase(), '\u1E9A', 'LATIN SMALL LETTER A WITH RIGHT HALF RING');
    arktest.assertEQ('\u1F50'.toLocaleLowerCase(), '\u1F50', 'GREEK SMALL LETTER UPSILON WITH PSILI');
    arktest.assertEQ('\u1F52'.toLocaleLowerCase(), '\u1F52', 'GREEK SMALL LETTER UPSILON WITH PSILI AND VARIA');
    arktest.assertEQ('\u1F54'.toLocaleLowerCase(), '\u1F54', 'GREEK SMALL LETTER UPSILON WITH PSILI AND OXIA');
    arktest.assertEQ('\u1F56'.toLocaleLowerCase(), '\u1F56', 'GREEK SMALL LETTER UPSILON WITH PSILI AND PERISPOMENI');
    arktest.assertEQ('\u1FB6'.toLocaleLowerCase(), '\u1FB6', 'GREEK SMALL LETTER ALPHA WITH PERISPOMENI');
    arktest.assertEQ('\u1FC6'.toLocaleLowerCase(), '\u1FC6', 'GREEK SMALL LETTER ETA WITH PERISPOMENI');
    arktest.assertEQ('\u1FD2'.toLocaleLowerCase(), '\u1FD2', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND VARIA');
    arktest.assertEQ('\u1FD3'.toLocaleLowerCase(), '\u1FD3', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND OXIA');
    arktest.assertEQ('\u1FD6'.toLocaleLowerCase(), '\u1FD6', 'GREEK SMALL LETTER IOTA WITH PERISPOMENI');
    arktest.assertEQ('\u1FD7'.toLocaleLowerCase(), '\u1FD7', 'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND PERISPOMENI');
    arktest.assertEQ('\u1FE2'.toLocaleLowerCase(), '\u1FE2', 'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND VARIA');
    arktest.assertEQ('\u1FE3'.toLocaleLowerCase(), '\u1FE3', 'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND OXIA');
    arktest.assertEQ('\u1FE4'.toLocaleLowerCase(), '\u1FE4', 'GREEK SMALL LETTER RHO WITH PSILI');
    arktest.assertEQ('\u1FE6'.toLocaleLowerCase(), '\u1FE6', 'GREEK SMALL LETTER UPSILON WITH PERISPOMENI');
        arktest.assertEQ('\u1FE7'.toLocaleLowerCase(), '\u1FE7',
        'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND PERISPOMENI');
    arktest.assertEQ('\u1FF6'.toLocaleLowerCase(), '\u1FF6', 'GREEK SMALL LETTER OMEGA WITH PERISPOMENI');
    arktest.assertEQ('\u1F80'.toLocaleLowerCase(), '\u1F80', 'GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F81'.toLocaleLowerCase(), '\u1F81', 'GREEK SMALL LETTER ALPHA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F82'.toLocaleLowerCase(), '\u1F82',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F83'.toLocaleLowerCase(), '\u1F83',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F84'.toLocaleLowerCase(), '\u1F84',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F85'.toLocaleLowerCase(), '\u1F85',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F86'.toLocaleLowerCase(), '\u1F86',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F87'.toLocaleLowerCase(), '\u1F87',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F88'.toLocaleLowerCase(), '\u1F80',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F89'.toLocaleLowerCase(), '\u1F81',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8A'.toLocaleLowerCase(), '\u1F82',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8B'.toLocaleLowerCase(), '\u1F83',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8C'.toLocaleLowerCase(), '\u1F84',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8D'.toLocaleLowerCase(), '\u1F85',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8E'.toLocaleLowerCase(), '\u1F86',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8F'.toLocaleLowerCase(), '\u1F87',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1F90'.toLocaleLowerCase(), '\u1F90', 'GREEK SMALL LETTER ETA WITH PSILI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F91'.toLocaleLowerCase(), '\u1F91', 'GREEK SMALL LETTER ETA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F92'.toLocaleLowerCase(), '\u1F92',
        'GREEK SMALL LETTER ETA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F93'.toLocaleLowerCase(), '\u1F93',
        'GREEK SMALL LETTER ETA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F94'.toLocaleLowerCase(), '\u1F94',
        'GREEK SMALL LETTER ETA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F95'.toLocaleLowerCase(), '\u1F95',
        'GREEK SMALL LETTER ETA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F96'.toLocaleLowerCase(), '\u1F96',
        'GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F97'.toLocaleLowerCase(), '\u1F97',
        'GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1F98'.toLocaleLowerCase(), '\u1F90', 'GREEK CAPITAL LETTER ETA WITH PSILI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1F99'.toLocaleLowerCase(), '\u1F91', 'GREEK CAPITAL LETTER ETA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9A'.toLocaleLowerCase(), '\u1F92',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9B'.toLocaleLowerCase(), '\u1F93',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9C'.toLocaleLowerCase(), '\u1F94',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9D'.toLocaleLowerCase(), '\u1F95',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9E'.toLocaleLowerCase(), '\u1F96',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9F'.toLocaleLowerCase(), '\u1F97',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1FA0'.toLocaleLowerCase(), '\u1FA0', 'GREEK SMALL LETTER OMEGA WITH PSILI AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FA1'.toLocaleLowerCase(), '\u1FA1', 'GREEK SMALL LETTER OMEGA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA2'.toLocaleLowerCase(), '\u1FA2',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA3'.toLocaleLowerCase(), '\u1FA3',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA4'.toLocaleLowerCase(), '\u1FA4',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA5'.toLocaleLowerCase(), '\u1FA5',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA6'.toLocaleLowerCase(), '\u1FA6',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA7'.toLocaleLowerCase(), '\u1FA7',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA8'.toLocaleLowerCase(), '\u1FA0',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FA9'.toLocaleLowerCase(), '\u1FA1',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAA'.toLocaleLowerCase(), '\u1FA2',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAB'.toLocaleLowerCase(), '\u1FA3',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAC'.toLocaleLowerCase(), '\u1FA4',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAD'.toLocaleLowerCase(), '\u1FA5',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAE'.toLocaleLowerCase(), '\u1FA6',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAF'.toLocaleLowerCase(), '\u1FA7',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1FB3'.toLocaleLowerCase(), '\u1FB3', 'GREEK SMALL LETTER ALPHA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FBC'.toLocaleLowerCase(), '\u1FB3', 'GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FC3'.toLocaleLowerCase(), '\u1FC3', 'GREEK SMALL LETTER ETA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FCC'.toLocaleLowerCase(), '\u1FC3', 'GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FF3'.toLocaleLowerCase(), '\u1FF3', 'GREEK SMALL LETTER OMEGA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FFC'.toLocaleLowerCase(), '\u1FF3', 'GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FB2'.toLocaleLowerCase(), '\u1FB2', 'GREEK SMALL LETTER ALPHA WITH VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FB4'.toLocaleLowerCase(), '\u1FB4', 'GREEK SMALL LETTER ALPHA WITH OXIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FC2'.toLocaleLowerCase(), '\u1FC2', 'GREEK SMALL LETTER ETA WITH VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FC4'.toLocaleLowerCase(), '\u1FC4', 'GREEK SMALL LETTER ETA WITH OXIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FF2'.toLocaleLowerCase(), '\u1FF2', 'GREEK SMALL LETTER OMEGA WITH VARIA AND YPOGEGRAMMENI');
    arktest.assertEQ('\u1FF4'.toLocaleLowerCase(), '\u1FF4', 'GREEK SMALL LETTER OMEGA WITH OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FB7'.toLocaleLowerCase(), '\u1FB7',
        'GREEK SMALL LETTER ALPHA WITH PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FC7'.toLocaleLowerCase(), '\u1FC7',
        'GREEK SMALL LETTER ETA WITH PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FF7'.toLocaleLowerCase(), '\u1FF7',
        'GREEK SMALL LETTER OMEGA WITH PERISPOMENI AND YPOGEGRAMMENI');
}