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
// arktsid: exec_match_06
// description: String is "zaacbbbcac" and RegExp is /(z)((a+)?(b+)?(c))*/

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('(z)((a+)?(b+)?(c))*').exec('zaacbbbcac');
    if (executed == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 6, 'length');
    arktest.assertEQ(executed.index, 0, 'index');
    arktest.assertEQ(executed.input, 'zaacbbbcac', 'input');
    arktest.assertEQ(executed[0], 'zaacbbbcac', 'element 0');
    arktest.assertEQ(executed[1], 'z', 'element 1');
    arktest.assertEQ(executed[2], 'ac', 'element 2');
    arktest.assertEQ(executed[3], 'a', 'element 3');
    arktest.assertEQ(executed[4], undefined, 'element 4');
    arktest.assertEQ(executed[5], 'c', 'element 5');
}