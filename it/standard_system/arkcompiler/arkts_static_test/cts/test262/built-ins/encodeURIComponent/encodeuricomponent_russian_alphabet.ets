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
// arktsid: encodeuricomponent_russian_alphabet
// description: encodeURIComponent encoding of Russian (Cyrillic) alphabet in URLs

function main(): void {
    // CHECK#1: URL with Cyrillic word "Юникод" encoded as %D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4
    let encoded1: string = encodeURIComponent('http://' + 'example.com/wiki/Юникод');
    arktest.assertTrue(
        encoded1 === 'http%3A%2F%2F' + 'example.com%2Fwiki%2F%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4' ||
        encoded1 === 'http%3A%2F%2F' + 'example.com%2Fwiki%2F%d0%ae%d0%bd%d0%b8%d0%ba%d0%be%d0%b4',
        'Cyrillic word \'Юникод\' encoded correctly (case-insensitive hex)');

    // CHECK#2: URL with Cyrillic "Юникод#Ссылки" encoded correctly
    let encoded2: string = encodeURIComponent('http://' + 'example.com/wiki/Юникод#Ссылки');
    arktest.assertTrue(
                                                                encoded2 === 'http%3A%2F%2F' +
                                    'example.com%2Fwiki%2F%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4' +
                    '%23%D0%A1%D1%81%D1%8B%D0%BB%D0' +
            '%BA%D0%B8' ||
                                                                encoded2 === 'http%3A%2F%2F' +
                                    'example.com%2Fwiki%2F%d0%ae%d0%bd%d0%b8%d0%ba%d0%be%d0%b4' +
                    '%23%d1%81%d1%81%d1%8b%d0%bb%d0' +
            '%ba%d0%b8',
        'Cyrillic \'Юникод#Ссылки\' encoded correctly (case-insensitive hex)');
}