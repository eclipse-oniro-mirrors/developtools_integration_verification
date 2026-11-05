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

// arktsid: identifier_start_escape_sequence
// description: IdentifierStart UnicodeEscapeSequence

function main(): void {
    let \u0078: int = 1;
    arktest.assertEQ(\u0078, 1);

    let \u0078\u0078: int = 2;
    arktest.assertEQ(\u0078\u0078, 2);

    let \u0024: int = 3;
    arktest.assertEQ(\u0024, 3);

    let \u0024x: int = 4;
    arktest.assertEQ(\u0024x, 4);

    let \u0024\u0024: int = 5;
    arktest.assertEQ(\u0024\u0024, 5);

    let \u0024_: int = 6;
    arktest.assertEQ(\u0024_, 6);

    let \u005F: int = 7;
    arktest.assertEQ(\u005F, 7);

    let \u005Fx: int = 8;
    arktest.assertEQ(\u005Fx, 8);

    let \u005F\u0024: int = 9;
    arktest.assertEQ(\u005F\u0024, 9);

    let \u005F\u005F: int = 10;
    arktest.assertEQ(\u005F\u005F, 10);
}
