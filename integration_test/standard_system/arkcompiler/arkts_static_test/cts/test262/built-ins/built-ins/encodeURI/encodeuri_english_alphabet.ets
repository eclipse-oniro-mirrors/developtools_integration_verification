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

// arktsid: encodeuri_english_alphabet
// description: encodeURI leaves English alphabet and URI unreserved/reserved characters unescaped

function main(): void {
    // CHECK#1: URL with digits stays untouched
    arktest.assertEQ(encodeURI('http://' + 'example.com/0123456789'), 'http://' + 'example.com/0123456789',
        'URL with digits unchanged');

    // CHECK#2: English alphabet letters stay untouched
    arktest.assertEQ(encodeURI('aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ'),
        'aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ',
        'English alphabet letters unchanged');

    // CHECK#3: URI reserved and unreserved marks stay untouched
    arktest.assertEQ(encodeURI('aA_bB-cC.dD!eE~fF*gG\'hH(iI)jJ;kK/lL?mM:nN@oO&pP=qQ+rR$sS,tT9uU8vV7wW6xX5yY4zZ'),
        'aA_bB-cC.dD!eE~fF*gG\'hH(iI)jJ;kK/lL?mM:nN@oO&pP=qQ+rR$sS,tT9uU8vV7wW6xX5yY4zZ',
        'URI marks unchanged');
}