/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: exec_match_02
// description: String is "123" and RegExp is /((1)|(12))((3)|(23))/
// Conversion notes:
//  - new String("123") coerces to the primitive "123" (ToString), so exec is called with "123".
//  - Non-participating capture groups are undefined in RegExpExecArray, so the result is
//    ["123", "1", "1", undefined, "23", undefined, "23"] with index 0 and input "123".

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('((1)|(12))((3)|(23))').exec('123');
    if (executed == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 7, 'length');
    arktest.assertEQ(executed.index, 0, 'index');
    arktest.assertEQ(executed.input, '123', 'input');
    arktest.assertEQ(executed[0], '123', 'element 0');
    arktest.assertEQ(executed[1], '1', 'element 1');
    arktest.assertEQ(executed[2], '1', 'element 2');
    arktest.assertEQ(executed[3], undefined, 'element 3');
    arktest.assertEQ(executed[4], '23', 'element 4');
    arktest.assertEQ(executed[5], undefined, 'element 5');
    arktest.assertEQ(executed[6], '23', 'element 6');
}