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

// arktsid: encodeuri_russian_alphabet
// description: encodeURI correctly percent-encodes Russian/Cyrillic characters in URLs

function main(): void {
    // CHECK#1: Russian URL path
    arktest.assertEQ(encodeURI('http://' + 'example.com/wiki/Юникод'),
        'http://' + 'example.com/wiki/%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4',
        'Russian URL path encoded');

    // CHECK#2: Russian URL with fragment
    arktest.assertEQ(encodeURI('http://' + 'example.com/wiki/Юникод#Ссылки'),
        'http://' + 'example.com/wiki/%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4#%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B8',
        'Russian URL with fragment');

    // CHECK#3: Russian URL with space-separated words in fragment
    arktest.assertEQ(encodeURI('http://' + 'example.com/wiki/Юникод#Версии Юникода'),
                                'http://' +
                    'example.com/wiki/%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4#%D0%92%D0%B5%D1%80%D1%81%D0%B8%D0%B8%20' +
            '%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4%D0%B0',
        'Russian URL with space-separated fragment');
}