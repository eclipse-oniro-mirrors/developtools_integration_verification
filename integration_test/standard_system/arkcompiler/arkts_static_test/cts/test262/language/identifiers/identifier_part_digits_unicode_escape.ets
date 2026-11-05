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

// arktsid: identifier_part_digits_unicode_escape
// description: Identifier parts can use four-digit Unicode escapes for digits

function main(): void {
    let $\u0030: int = 0;
    arktest.assertEQ($\u0030, 0, 'digit zero in identifier');

    let $\u0031: int = 1;
    arktest.assertEQ($\u0031, 1, 'digit one in identifier');

    let $\u0032: int = 2;
    arktest.assertEQ($\u0032, 2, 'digit two in identifier');

    let $\u0033: int = 3;
    arktest.assertEQ($\u0033, 3, 'digit three in identifier');

    let $\u0034: int = 4;
    arktest.assertEQ($\u0034, 4, 'digit four in identifier');

    let $\u0035: int = 5;
    arktest.assertEQ($\u0035, 5, 'digit five in identifier');

    let $\u0036: int = 6;
    arktest.assertEQ($\u0036, 6, 'digit six in identifier');

    let $\u0037: int = 7;
    arktest.assertEQ($\u0037, 7, 'digit seven in identifier');

    let $\u0038: int = 8;
    arktest.assertEQ($\u0038, 8, 'digit eight in identifier');

    let $\u0039: int = 9;
    arktest.assertEQ($\u0039, 9, 'digit nine in identifier');
}
