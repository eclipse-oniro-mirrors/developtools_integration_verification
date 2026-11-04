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
// description: Check if String.prototype.toLocaleUpperCase supports mappings defined in SpecialCasings

function main(): void {
    arktest.assertEQ('\u00DF'.toLocaleUpperCase(), '\u0053\u0053', 'LATIN SMALL LETTER SHARP S');
    arktest.assertEQ('\u0130'.toLocaleUpperCase(), '\u0130', 'LATIN CAPITAL LETTER I WITH DOT ABOVE');
    arktest.assertEQ('\uFB00'.toLocaleUpperCase(), '\u0046\u0046', 'LATIN SMALL LIGATURE FF');
    arktest.assertEQ('\uFB01'.toLocaleUpperCase(), '\u0046\u0049', 'LATIN SMALL LIGATURE FI');
    arktest.assertEQ('\uFB02'.toLocaleUpperCase(), '\u0046\u004C', 'LATIN SMALL LIGATURE FL');
    arktest.assertEQ('\uFB03'.toLocaleUpperCase(), '\u0046\u0046\u0049', 'LATIN SMALL LIGATURE FFI');
    arktest.assertEQ('\uFB04'.toLocaleUpperCase(), '\u0046\u0046\u004C', 'LATIN SMALL LIGATURE FFL');
    arktest.assertEQ('\uFB05'.toLocaleUpperCase(), '\u0053\u0054', 'LATIN SMALL LIGATURE LONG S T');
    arktest.assertEQ('\uFB06'.toLocaleUpperCase(), '\u0053\u0054', 'LATIN SMALL LIGATURE ST');
    arktest.assertEQ('\u0587'.toLocaleUpperCase(), '\u0535\u0552', 'ARMENIAN SMALL LIGATURE ECH YIWN');
    arktest.assertEQ('\uFB13'.toLocaleUpperCase(), '\u0544\u0546', 'ARMENIAN SMALL LIGATURE MEN NOW');
    arktest.assertEQ('\uFB14'.toLocaleUpperCase(), '\u0544\u0535', 'ARMENIAN SMALL LIGATURE MEN ECH');
    arktest.assertEQ('\uFB15'.toLocaleUpperCase(), '\u0544\u053B', 'ARMENIAN SMALL LIGATURE MEN INI');
    arktest.assertEQ('\uFB16'.toLocaleUpperCase(), '\u054E\u0546', 'ARMENIAN SMALL LIGATURE VEW NOW');
    arktest.assertEQ('\uFB17'.toLocaleUpperCase(), '\u0544\u053D', 'ARMENIAN SMALL LIGATURE MEN XEH');
    arktest.assertEQ('\u0149'.toLocaleUpperCase(), '\u02BC\u004E', 'LATIN SMALL LETTER N PRECEDED BY APOSTROPHE');
        arktest.assertEQ('\u0390'.toLocaleUpperCase(), '\u0399\u0308\u0301',
        'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS');
        arktest.assertEQ('\u03B0'.toLocaleUpperCase(), '\u03A5\u0308\u0301',
        'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS');
    arktest.assertEQ('\u01F0'.toLocaleUpperCase(), '\u004A\u030C', 'LATIN SMALL LETTER J WITH CARON');
    arktest.assertEQ('\u1E96'.toLocaleUpperCase(), '\u0048\u0331', 'LATIN SMALL LETTER H WITH LINE BELOW');
    arktest.assertEQ('\u1E97'.toLocaleUpperCase(), '\u0054\u0308', 'LATIN SMALL LETTER T WITH DIAERESIS');
    arktest.assertEQ('\u1E98'.toLocaleUpperCase(), '\u0057\u030A', 'LATIN SMALL LETTER W WITH RING ABOVE');
    arktest.assertEQ('\u1E99'.toLocaleUpperCase(), '\u0059\u030A', 'LATIN SMALL LETTER Y WITH RING ABOVE');
    arktest.assertEQ('\u1E9A'.toLocaleUpperCase(), '\u0041\u02BE', 'LATIN SMALL LETTER A WITH RIGHT HALF RING');
    arktest.assertEQ('\u1F50'.toLocaleUpperCase(), '\u03A5\u0313', 'GREEK SMALL LETTER UPSILON WITH PSILI');
        arktest.assertEQ('\u1F52'.toLocaleUpperCase(), '\u03A5\u0313\u0300',
        'GREEK SMALL LETTER UPSILON WITH PSILI AND VARIA');
        arktest.assertEQ('\u1F54'.toLocaleUpperCase(), '\u03A5\u0313\u0301',
        'GREEK SMALL LETTER UPSILON WITH PSILI AND OXIA');
        arktest.assertEQ('\u1F56'.toLocaleUpperCase(), '\u03A5\u0313\u0342',
        'GREEK SMALL LETTER UPSILON WITH PSILI AND PERISPOMENI');
    arktest.assertEQ('\u1FB6'.toLocaleUpperCase(), '\u0391\u0342', 'GREEK SMALL LETTER ALPHA WITH PERISPOMENI');
    arktest.assertEQ('\u1FC6'.toLocaleUpperCase(), '\u0397\u0342', 'GREEK SMALL LETTER ETA WITH PERISPOMENI');
        arktest.assertEQ('\u1FD2'.toLocaleUpperCase(), '\u0399\u0308\u0300',
        'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND VARIA');
        arktest.assertEQ('\u1FD3'.toLocaleUpperCase(), '\u0399\u0308\u0301',
        'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND OXIA');
    arktest.assertEQ('\u1FD6'.toLocaleUpperCase(), '\u0399\u0342', 'GREEK SMALL LETTER IOTA WITH PERISPOMENI');
        arktest.assertEQ('\u1FD7'.toLocaleUpperCase(), '\u0399\u0308\u0342',
        'GREEK SMALL LETTER IOTA WITH DIALYTIKA AND PERISPOMENI');
        arktest.assertEQ('\u1FE2'.toLocaleUpperCase(), '\u03A5\u0308\u0300',
        'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND VARIA');
        arktest.assertEQ('\u1FE3'.toLocaleUpperCase(), '\u03A5\u0308\u0301',
        'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND OXIA');
    arktest.assertEQ('\u1FE4'.toLocaleUpperCase(), '\u03A1\u0313', 'GREEK SMALL LETTER RHO WITH PSILI');
    arktest.assertEQ('\u1FE6'.toLocaleUpperCase(), '\u03A5\u0342', 'GREEK SMALL LETTER UPSILON WITH PERISPOMENI');
        arktest.assertEQ('\u1FE7'.toLocaleUpperCase(), '\u03A5\u0308\u0342',
        'GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND PERISPOMENI');
    arktest.assertEQ('\u1FF6'.toLocaleUpperCase(), '\u03A9\u0342', 'GREEK SMALL LETTER OMEGA WITH PERISPOMENI');
        arktest.assertEQ('\u1F80'.toLocaleUpperCase(), '\u1F08\u0399',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F81'.toLocaleUpperCase(), '\u1F09\u0399',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F82'.toLocaleUpperCase(), '\u1F0A\u0399',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F83'.toLocaleUpperCase(), '\u1F0B\u0399',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F84'.toLocaleUpperCase(), '\u1F0C\u0399',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F85'.toLocaleUpperCase(), '\u1F0D\u0399',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F86'.toLocaleUpperCase(), '\u1F0E\u0399',
        'GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F87'.toLocaleUpperCase(), '\u1F0F\u0399',
        'GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F88'.toLocaleUpperCase(), '\u1F08\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F89'.toLocaleUpperCase(), '\u1F09\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8A'.toLocaleUpperCase(), '\u1F0A\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8B'.toLocaleUpperCase(), '\u1F0B\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8C'.toLocaleUpperCase(), '\u1F0C\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8D'.toLocaleUpperCase(), '\u1F0D\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8E'.toLocaleUpperCase(), '\u1F0E\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F8F'.toLocaleUpperCase(), '\u1F0F\u0399',
        'GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F90'.toLocaleUpperCase(), '\u1F28\u0399',
        'GREEK SMALL LETTER ETA WITH PSILI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F91'.toLocaleUpperCase(), '\u1F29\u0399',
        'GREEK SMALL LETTER ETA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F92'.toLocaleUpperCase(), '\u1F2A\u0399',
        'GREEK SMALL LETTER ETA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F93'.toLocaleUpperCase(), '\u1F2B\u0399',
        'GREEK SMALL LETTER ETA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F94'.toLocaleUpperCase(), '\u1F2C\u0399',
        'GREEK SMALL LETTER ETA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F95'.toLocaleUpperCase(), '\u1F2D\u0399',
        'GREEK SMALL LETTER ETA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F96'.toLocaleUpperCase(), '\u1F2E\u0399',
        'GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F97'.toLocaleUpperCase(), '\u1F2F\u0399',
        'GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1F98'.toLocaleUpperCase(), '\u1F28\u0399',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F99'.toLocaleUpperCase(), '\u1F29\u0399',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9A'.toLocaleUpperCase(), '\u1F2A\u0399',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9B'.toLocaleUpperCase(), '\u1F2B\u0399',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9C'.toLocaleUpperCase(), '\u1F2C\u0399',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9D'.toLocaleUpperCase(), '\u1F2D\u0399',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9E'.toLocaleUpperCase(), '\u1F2E\u0399',
        'GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1F9F'.toLocaleUpperCase(), '\u1F2F\u0399',
        'GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FA0'.toLocaleUpperCase(), '\u1F68\u0399',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA1'.toLocaleUpperCase(), '\u1F69\u0399',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA2'.toLocaleUpperCase(), '\u1F6A\u0399',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA3'.toLocaleUpperCase(), '\u1F6B\u0399',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA4'.toLocaleUpperCase(), '\u1F6C\u0399',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA5'.toLocaleUpperCase(), '\u1F6D\u0399',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA6'.toLocaleUpperCase(), '\u1F6E\u0399',
        'GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA7'.toLocaleUpperCase(), '\u1F6F\u0399',
        'GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FA8'.toLocaleUpperCase(), '\u1F68\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FA9'.toLocaleUpperCase(), '\u1F69\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAA'.toLocaleUpperCase(), '\u1F6A\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAB'.toLocaleUpperCase(), '\u1F6B\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAC'.toLocaleUpperCase(), '\u1F6C\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAD'.toLocaleUpperCase(), '\u1F6D\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAE'.toLocaleUpperCase(), '\u1F6E\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI');
        arktest.assertEQ('\u1FAF'.toLocaleUpperCase(), '\u1F6F\u0399',
        'GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI');
    arktest.assertEQ('\u1FB3'.toLocaleUpperCase(), '\u0391\u0399', 'GREEK SMALL LETTER ALPHA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FBC'.toLocaleUpperCase(), '\u0391\u0399', 'GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FC3'.toLocaleUpperCase(), '\u0397\u0399', 'GREEK SMALL LETTER ETA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FCC'.toLocaleUpperCase(), '\u0397\u0399', 'GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI');
    arktest.assertEQ('\u1FF3'.toLocaleUpperCase(), '\u03A9\u0399', 'GREEK SMALL LETTER OMEGA WITH YPOGEGRAMMENI');
    arktest.assertEQ('\u1FFC'.toLocaleUpperCase(), '\u03A9\u0399', 'GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI');
        arktest.assertEQ('\u1FB2'.toLocaleUpperCase(), '\u1FBA\u0399',
        'GREEK SMALL LETTER ALPHA WITH VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FB4'.toLocaleUpperCase(), '\u0386\u0399',
        'GREEK SMALL LETTER ALPHA WITH OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FC2'.toLocaleUpperCase(), '\u1FCA\u0399',
        'GREEK SMALL LETTER ETA WITH VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FC4'.toLocaleUpperCase(), '\u0389\u0399',
        'GREEK SMALL LETTER ETA WITH OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FF2'.toLocaleUpperCase(), '\u1FFA\u0399',
        'GREEK SMALL LETTER OMEGA WITH VARIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FF4'.toLocaleUpperCase(), '\u038F\u0399',
        'GREEK SMALL LETTER OMEGA WITH OXIA AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FB7'.toLocaleUpperCase(), '\u0391\u0342\u0399',
        'GREEK SMALL LETTER ALPHA WITH PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FC7'.toLocaleUpperCase(), '\u0397\u0342\u0399',
        'GREEK SMALL LETTER ETA WITH PERISPOMENI AND YPOGEGRAMMENI');
        arktest.assertEQ('\u1FF7'.toLocaleUpperCase(), '\u03A9\u0342\u0399',
        'GREEK SMALL LETTER OMEGA WITH PERISPOMENI AND YPOGEGRAMMENI');
}