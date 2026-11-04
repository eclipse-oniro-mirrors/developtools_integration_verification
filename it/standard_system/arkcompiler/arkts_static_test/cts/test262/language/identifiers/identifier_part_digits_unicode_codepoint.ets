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

// arktsid: identifier_part_digits_unicode_codepoint
// description: Identifier parts can use Unicode code point escapes for digits

function main(): void {
    let $\u{30}: int = 0;
    arktest.assertEQ($\u{30}, 0, 'digit zero in identifier');

    let $\u{31}: int = 1;
    arktest.assertEQ($\u{31}, 1, 'digit one in identifier');

    let $\u{32}: int = 2;
    arktest.assertEQ($\u{32}, 2, 'digit two in identifier');

    let $\u{33}: int = 3;
    arktest.assertEQ($\u{33}, 3, 'digit three in identifier');

    let $\u{34}: int = 4;
    arktest.assertEQ($\u{34}, 4, 'digit four in identifier');

    let $\u{35}: int = 5;
    arktest.assertEQ($\u{35}, 5, 'digit five in identifier');

    let $\u{36}: int = 6;
    arktest.assertEQ($\u{36}, 6, 'digit six in identifier');

    let $\u{37}: int = 7;
    arktest.assertEQ($\u{37}, 7, 'digit seven in identifier');

    let $\u{38}: int = 8;
    arktest.assertEQ($\u{38}, 8, 'digit eight in identifier');

    let $\u{39}: int = 9;
    arktest.assertEQ($\u{39}, 9, 'digit nine in identifier');
}
