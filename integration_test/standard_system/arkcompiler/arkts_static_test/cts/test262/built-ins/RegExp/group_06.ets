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
// arktsid: group_06
// description: Execute /(.{3})(.{4})/.exec("abcdefgh") and check results

function main(): void {
    let regObj: RegExp = new RegExp('(.{3})(.{4})');
    let result: RegExpExecArray | null = regObj.exec('abcdefgh');
    if (result == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(result.length, 3);
    arktest.assertEQ(result.index, 0);
    arktest.assertEQ(result.input, 'abcdefgh');
    arktest.assertEQ(result[0], 'abcdefg');
    arktest.assertEQ(result[1], 'abc');
    arktest.assertEQ(result[2], 'defg');
}