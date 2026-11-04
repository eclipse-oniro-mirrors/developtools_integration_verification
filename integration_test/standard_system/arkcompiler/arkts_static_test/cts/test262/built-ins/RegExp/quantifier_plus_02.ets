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
// arktsid: quantifier_plus_02
// description: Execute /\s+java\s+/.exec("\t java object") and check results

function main(): void {
    let r: RegExp = new RegExp('\\s+java\\s+');
    let executed: RegExpExecArray | null = r.exec('\t java object');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1, 'The value of executed.length is expected to equal 1');
        arktest.assertEQ(executed.index, 0, 'The value of executed.index is expected to equal 0');
                arktest.assertEQ(executed.input, '\t java object',
            'The value of executed.input is expected to equal the original string');
        arktest.assertEQ(executed[0], '\t java ', 'The value of executed[0] is expected to equal \'\t java \'');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}