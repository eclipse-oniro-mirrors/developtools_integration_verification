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

// arktsid: non_escape_lowercase_characters
// description: Lowercase non-escape characters after a backslash retain their characters

function main(): void {
    arktest.assertEQ('a', '\a', 'non-escape a');
    arktest.assertEQ('c', '\c', 'non-escape c');
    arktest.assertEQ('d', '\d', 'non-escape d');
    arktest.assertEQ('e', '\e', 'non-escape e');
    arktest.assertEQ('g', '\g', 'non-escape g');
    arktest.assertEQ('h', '\h', 'non-escape h');
    arktest.assertEQ('i', '\i', 'non-escape i');
    arktest.assertEQ('j', '\j', 'non-escape j');
    arktest.assertEQ('k', '\k', 'non-escape k');
    arktest.assertEQ('l', '\l', 'non-escape l');
    arktest.assertEQ('m', '\m', 'non-escape m');
    arktest.assertEQ('o', '\o', 'non-escape o');
    arktest.assertEQ('p', '\p', 'non-escape p');
    arktest.assertEQ('q', '\q', 'non-escape q');
    arktest.assertEQ('s', '\s', 'non-escape s');
    arktest.assertEQ('w', '\w', 'non-escape w');
    arktest.assertEQ('y', '\y', 'non-escape y');
    arktest.assertEQ('z', '\z', 'non-escape z');
}
