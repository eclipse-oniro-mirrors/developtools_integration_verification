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
// arktsid: string_return_single_code_unit
// description: Return single code unit value of the element at index position.

function main(): void {
    arktest.assertEQ('abc'.codePointAt(0), 97, '');
    arktest.assertEQ('abc'.codePointAt(1), 98, '');
    arktest.assertEQ('abc'.codePointAt(2), 99, '');
    arktest.assertEQ('\uAAAA\uBBBB'.codePointAt(0), 0xAAAA, '');
    arktest.assertEQ('\uD7FF\uAAAA'.codePointAt(0), 0xD7FF, '');
    arktest.assertEQ('\uDC00\uAAAA'.codePointAt(0), 0xDC00, '');
    arktest.assertEQ('\uAAAA\uBBBB'.codePointAt(0), 0xAAAA, '');
    arktest.assertEQ('123\uD800'.codePointAt(3), 0xD800, '');
    arktest.assertEQ('123\uDAAA'.codePointAt(3), 0xDAAA, '');
    arktest.assertEQ('123\uDBFF'.codePointAt(3), 0xDBFF, '');
}