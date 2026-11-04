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

// arktsid: assertion_repeat_02
// description: Repeating zero-width assertions does not change endIndex: exec("robot wall-e") matches "bot" at index 2
// Conversion notes:
//  - \B and \b are zero-width word-boundary assertions, so repeating them does not advance the match position.

function main(): void {
    let regexp: RegExp = new RegExp('\\B\\B\\B\\B\\B\\Bbot\\b\\b\\b\\b\\b\\b\\b');
    let executed: RegExpExecArray | null = regexp.exec('robot wall-e');

    let expected: String[] = ['bot'];

    if (executed != null) {
        arktest.assertEQ(executed.length, expected.length, 'length');
        arktest.assertEQ(executed.index, 2, 'index');
        arktest.assertEQ(executed.input, 'robot wall-e', 'input');
        for (let i: int = 0; i < expected.length; i++) {
            arktest.assertEQ(executed[i], expected[i], 'element ' + i);
        }
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}