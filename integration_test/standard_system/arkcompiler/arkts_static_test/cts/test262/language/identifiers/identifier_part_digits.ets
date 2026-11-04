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

// arktsid: identifier_part_digits
// description: Digits can occur after the first identifier character

function main(): void {
    let $0: int = 0;
    arktest.assertEQ($0, 0, 'digit zero in identifier');

    let $1: int = 1;
    arktest.assertEQ($1, 1, 'digit one in identifier');

    let $2: int = 2;
    arktest.assertEQ($2, 2, 'digit two in identifier');

    let $3: int = 3;
    arktest.assertEQ($3, 3, 'digit three in identifier');

    let $4: int = 4;
    arktest.assertEQ($4, 4, 'digit four in identifier');

    let $5: int = 5;
    arktest.assertEQ($5, 5, 'digit five in identifier');

    let $6: int = 6;
    arktest.assertEQ($6, 6, 'digit six in identifier');

    let $7: int = 7;
    arktest.assertEQ($7, 7, 'digit seven in identifier');

    let $8: int = 8;
    arktest.assertEQ($8, 8, 'digit eight in identifier');

    let $9: int = 9;
    arktest.assertEQ($9, 9, 'digit nine in identifier');
}
