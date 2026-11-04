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
// arktsid: string_return_first_code_unit
// description: Returns code point of LeadSurrogate if not followed by a valid TrailSurrogate.

function main(): void {
    arktest.assertEQ('\uD800\uDBFF'.codePointAt(0), 0xD800, '');
    arktest.assertEQ('\uD800\uE000'.codePointAt(0), 0xD800, '');
    arktest.assertEQ('\uDAAA\uDBFF'.codePointAt(0), 0xDAAA, '');
    arktest.assertEQ('\uDAAA\uE000'.codePointAt(0), 0xDAAA, '');
    arktest.assertEQ('\uDBFF\uDBFF'.codePointAt(0), 0xDBFF, '');
    arktest.assertEQ('\uDBFF\uE000'.codePointAt(0), 0xDBFF, '');
    arktest.assertEQ('\uD800\u0000'.codePointAt(0), 0xD800, '');
    arktest.assertEQ('\uD800\uFFFF'.codePointAt(0), 0xD800, '');
    arktest.assertEQ('\uDAAA\u0000'.codePointAt(0), 0xDAAA, '');
    arktest.assertEQ('\uDAAA\uFFFF'.codePointAt(0), 0xDAAA, '');
    arktest.assertEQ('\uDBFF\uDBFF'.codePointAt(0), 0xDBFF, '');
    arktest.assertEQ('\uDBFF\uFFFF'.codePointAt(0), 0xDBFF, '');
}