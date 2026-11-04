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

// arktsid: replaceAll_dollar_apostrophe
// description: String.prototype.replaceAll treats $' as the portion of the string that follows the match
// Conversion notes: test262 getSubstitution $' (tail) semantics; ArkTS getSubstitution implements the same spec.

function main(): void {
    let str: String = 'Ninguém é igual a ninguém. Todo o ser humano é um estranho ímpar.';

    let r1: String = str.replaceAll('ninguém', '$\'');
                arktest.assertEQ(r1, 'Ninguém é igual a . Todo o ser humano é um estranho ímpar.. Todo o ser' +
            ' humano é um estranho ímpar.',
        'replace ninguém with $\'');

    let r2: String = str.replaceAll('.', '--- $\'');
                arktest.assertEQ(r2, 'Ninguém é igual a ninguém---  Todo o ser humano é um estranho ímpar. T' +
                    'odo o ser humano é um estranho' +
            ' ímpar--- ',
        'replace . with --- $\'');

    let r3: String = str.replaceAll('é', '($\')');
                arktest.assertEQ(r3, 'Ningu(m é igual a ninguém. Todo o ser humano é um estranho ímpar.)m ( ' +
                    'igual a ninguém. Todo o ser hu' +
            'mano é um estranho ímpar.) igual a ningu(m. Todo o ser humano é um estranho ímpar.)m. Todo o ser hum' +
            'ano ( um estranho ímpar.) um estranho ímpar.',
        'replace é with ($\')');

    let r4: String = str.replaceAll('é', '($\') $\'');
                arktest.assertEQ(r4, 'Ningu(m é igual a ninguém. Todo o ser humano é um estranho ímpar.) m é' +
                    ' igual a ninguém. Todo o ser h' +
            'umano é um estranho ímpar.m ( igual a ninguém. Todo o ser humano é um estranho ímpar.)  igual a ning' +
            'uém. Todo o ser humano é um estranho ímpar. igual a ningu(m. Todo o ser humano é um estranho ímpar.)' +
            ' m. Todo o ser humano é um estranho ímpar.m. Todo o ser humano ( um estranho ímpar.)  um estranho ím' +
            'par. um estranho ímpar.',
        'replace é with ($\') $\'');
}