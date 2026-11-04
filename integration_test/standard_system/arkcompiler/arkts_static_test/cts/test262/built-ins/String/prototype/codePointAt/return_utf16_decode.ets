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
// arktsid: string_return_utf16_decode
// description: Return UTF16 Decode value of the lead and trail elements at index position.

function main(): void {
    arktest.assertEQ('\uD800\uDC00'.codePointAt(0), 65536, 'U+10000');
    arktest.assertEQ('\uD800\uDDD0'.codePointAt(0), 66000, 'U+101D0');
    arktest.assertEQ('\uD800\uDFFF'.codePointAt(0), 66559, 'U+103FF');
    arktest.assertEQ('\uDAAA\uDC00'.codePointAt(0), 763904, 'U+BA800');
    arktest.assertEQ('\uDAAA\uDDD0'.codePointAt(0), 764368, 'U+BA9D0');
    arktest.assertEQ('\uDAAA\uDFFF'.codePointAt(0), 764927, 'U+BABFF');
    arktest.assertEQ('\uDBFF\uDC00'.codePointAt(0), 1113088, 'U+10FC00');
    arktest.assertEQ('\uDBFF\uDDD0'.codePointAt(0), 1113552, 'U+10FDD0');
    arktest.assertEQ('\uDBFF\uDFFF'.codePointAt(0), 1114111, 'U+10FFFF');
}