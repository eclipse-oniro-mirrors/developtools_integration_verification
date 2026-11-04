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

// arktsid: russian_capital_non_escape_sequences
// description: Non-escape sequences preserve Russian capital letters

function main(): void {
    let characters: string[] = [ '\А', '\Б', '\В', '\Г', '\Д', '\Е', '\Ж', '\З', '\И', '\Й', '\К', '\Л', '\М', '\Н',
        '\О', '\П', '\Р', '\С', '\Т', '\У', '\Ф', '\Х', '\Ц', '\Ч', '\Ш', '\Щ', '\Ъ', '\Ы', '\Ь', '\Э', '\Ю', '\Я',
        '\Ё'];
    let expected: string[] = [ 'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С',
        'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', 'Ё'];
    for (let index: int = 0; index < characters.length; index++) {
        arktest.assertEQ(expected[index], characters[index], 'Russian capital non-escape sequence');
    }
}