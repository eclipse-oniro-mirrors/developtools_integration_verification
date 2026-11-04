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

// arktsid: non_escape_uppercase_characters
// description: Uppercase non-escape characters after a backslash retain their characters

function main(): void {
    arktest.assertEQ('A', '\A', 'non-escape A');
    arktest.assertEQ('B', '\B', 'non-escape B');
    arktest.assertEQ('C', '\C', 'non-escape C');
    arktest.assertEQ('D', '\D', 'non-escape D');
    arktest.assertEQ('E', '\E', 'non-escape E');
    arktest.assertEQ('F', '\F', 'non-escape F');
    arktest.assertEQ('G', '\G', 'non-escape G');
    arktest.assertEQ('H', '\H', 'non-escape H');
    arktest.assertEQ('I', '\I', 'non-escape I');
    arktest.assertEQ('J', '\J', 'non-escape J');
    arktest.assertEQ('K', '\K', 'non-escape K');
    arktest.assertEQ('L', '\L', 'non-escape L');
    arktest.assertEQ('M', '\M', 'non-escape M');
    arktest.assertEQ('N', '\N', 'non-escape N');
    arktest.assertEQ('O', '\O', 'non-escape O');
    arktest.assertEQ('P', '\P', 'non-escape P');
    arktest.assertEQ('Q', '\Q', 'non-escape Q');
    arktest.assertEQ('R', '\R', 'non-escape R');
    arktest.assertEQ('S', '\S', 'non-escape S');
    arktest.assertEQ('T', '\T', 'non-escape T');
    arktest.assertEQ('U', '\U', 'non-escape U');
    arktest.assertEQ('V', '\V', 'non-escape V');
    arktest.assertEQ('W', '\W', 'non-escape W');
    arktest.assertEQ('X', '\X', 'non-escape X');
    arktest.assertEQ('Y', '\Y', 'non-escape Y');
    arktest.assertEQ('Z', '\Z', 'non-escape Z');
}
