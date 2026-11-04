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

// arktsid: sort_custom_comparefn_reverse_russian_alphabet
// description: A compareFn that inverts the default string ordering sorts a
//   Russian alphabet array into reverse order.
// Conversion notes:
//  - The source compareFn uses String(x)/String(y) comparisons; since the
//    elements are already strings, it is rewritten as a direct string compare
//    returning int: a < b => 1, a > b => -1, else 0 (inverse ordering).

function main(): void {
    let alphabetR: string[] = [ 'ё', 'я', 'ю', 'э', 'ь', 'ы', 'ъ', 'щ', 'ш', 'ч', 'ц', 'х', 'ф', 'у', 'т', 'с', 'р',
        'П', 'О', 'Н', 'М', 'Л', 'К', 'Й', 'И', 'З', 'Ж', 'Е', 'Д', 'Г', 'В', 'Б', 'А'];
    let alphabet: string[] = [ 'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'р', 'с',
        'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я', 'ё'];

    alphabet.sort((a: string, b: string): int => {
        if (a < b) {
            return 1;
        }
        if (a > b) {
            return -1;
        }
        return 0;
    });

    for (let i: int = 0; i < 26; i++) {
                arktest.assertEQ(alphabet[i], alphabetR[i],
            'alphabet[' + i.toString() + '] === alphabetR[' + i.toString() + ']');
    }
}