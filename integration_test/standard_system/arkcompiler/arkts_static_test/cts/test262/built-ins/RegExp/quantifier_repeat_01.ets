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

// arktsid: quantifier_repeat_01
// description: /a[a-z]{2,4}/.exec("abcdefghi") greedily matches "abcde", length=1 index=0

function main(): void {
    let regObj: RegExp = new RegExp('a[a-z]{2,4}');
    let executed: RegExpExecArray | null = regObj.exec('abcdefghi');
    if (executed == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 1);
    arktest.assertEQ(executed.index, 0);
    arktest.assertEQ(executed.input, 'abcdefghi');
    arktest.assertEQ(executed[0], 'abcde');
}