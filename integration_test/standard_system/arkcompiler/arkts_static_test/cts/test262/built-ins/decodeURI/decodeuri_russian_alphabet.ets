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

// arktsid: decodeuri_russian_alphabet
// description: decodeURI correctly decodes Russian (Cyrillic) alphabet in URLs

function main(): void {
    // Russian word "Юникод" (Unicode)
    arktest.assertEQ(decodeURI('http://' + 'example.com/wiki/%d0%ae%d0%bd%d0%b8%d0%ba%d0%be%d0%b4'),
        'http://' + 'example.com/wiki/Юникод',
        'decodeURI should decode Cyrillic \'Юникод\' in URL');

    // Russian URL with fragment "Ссылки" (Links)
                                arktest.assertEQ(decodeURI('http://' +
                    'example.com/wiki/%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4#%D0%A1%D1' +
            '%81%D1%8B%D0%BB%D0%BA%D0%B8'),
        
        'http://' + 'example.com/wiki/Юникод#Ссылки',
        'decodeURI should decode \'Юникод#Ссылки\'');

    // URL with %23 (encoded #) preserved and Russian characters decoded
                                arktest.assertEQ(decodeURI('http://' +
                    'example.com/wiki/%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4%23%D0%92%' +
                    'D0%B5%D1%80%D1%81%D0%B8%D0%B8%' +
            '20%D0%AE%D0%BD%D0%B8%D0%BA%D0%BE%D0%B4%D0%B0'),
        
        'http://' + 'example.com/wiki/Юникод%23Версии Юникода',
        'decodeURI should decode \'Юникод%23Версии Юникода\'');
}