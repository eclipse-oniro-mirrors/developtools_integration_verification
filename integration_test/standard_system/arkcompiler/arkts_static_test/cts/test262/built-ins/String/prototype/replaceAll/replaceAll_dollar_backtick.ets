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

// arktsid: replaceAll_dollar_backtick
// description: String.prototype.replaceAll treats $` as the portion of the string that precedes the match
// Conversion notes: test262 getSubstitution $` (head) semantics; ArkTS getSubstitution implements the same spec.

function main(): void {
    let str: String = 'Ninguém é igual a ninguém. Todo o ser humano é um estranho ímpar.';

    let r1: String = str.replaceAll('ninguém', '$`');
        arktest.assertEQ(r1, 'Ninguém é igual a Ninguém é igual a . Todo o ser humano é um estranho ímpar.',
        'replace ninguém with $`');

    let r2: String = str.replaceAll('Ninguém', '$`');
    arktest.assertEQ(r2, ' é igual a ninguém. Todo o ser humano é um estranho ímpar.', 'replace Ninguém with $`');

    let r3: String = str.replaceAll('ninguém', '($`)');
        arktest.assertEQ(r3, 'Ninguém é igual a (Ninguém é igual a ). Todo o ser humano é um estranho ímpar.',
        'replace ninguém with ($`)');

    let r4: String = str.replaceAll('é', '($`)');
                arktest.assertEQ(r4, 'Ningu(Ningu)m (Ninguém ) igual a ningu(Ninguém é igual a ningu)m. Todo' +
                    ' o ser humano (Ninguém é igual' +
            ' a ninguém. Todo o ser humano ) um estranho ímpar.',
        'replace é with ($`)');

    let r5: String = str.replaceAll('é', '($`) $`');
                arktest.assertEQ(r5, 'Ningu(Ningu) Ningum (Ninguém ) Ninguém  igual a ningu(Ninguém é igual ' +
                    'a ningu) Ninguém é igual a nin' +
            'gum. Todo o ser humano (Ninguém é igual a ninguém. Todo o ser humano ) Ninguém é igual a ninguém. To' +
            'do o ser humano  um estranho ímpar.',
        'replace é with ($`) $`');
}