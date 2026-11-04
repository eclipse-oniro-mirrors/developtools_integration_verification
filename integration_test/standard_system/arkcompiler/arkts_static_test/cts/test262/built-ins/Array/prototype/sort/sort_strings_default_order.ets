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

// arktsid: sort_strings_default_order
// description: Default sort (no compareFn) orders an English alphabet array by
//   string code-unit ordering.

function main(): void {
    let alphabetR: string[] = [ 'z', 'y', 'x', 'w', 'v', 'u', 't', 's', 'r', 'q', 'p', 'o', 'n', 'M', 'L', 'K', 'J',
        'I', 'H', 'G', 'F', 'E', 'D', 'C', 'B', 'A'];
    let alphabet: string[] = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'n', 'o', 'p', 'q', 'r',
        's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

    alphabetR.sort();

    arktest.assertEQ(alphabetR.length, 26, 'alphabetR.length');
    for (let i: int = 0; i < alphabetR.length; i++) {
                arktest.assertEQ(alphabetR[i], alphabet[i],
            'alphabetR[' + i.toString() + '] === alphabet[' + i.toString() + ']');
    }
}