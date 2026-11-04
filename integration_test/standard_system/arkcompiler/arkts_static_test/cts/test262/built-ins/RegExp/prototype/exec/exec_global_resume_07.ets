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

// arktsid: exec_global_resume_07
// description: RegExp is /\d+/ and tested string is "123 456 789"
// Conversion notes:
//  - Non-global regexp: exec always starts matching from index 0, lastIndex does
//    not advance, so each of the 10 calls returns "123".

function main(): void {
    let re = new RegExp('\\d+');
    let matched: String[] = [];
    let expected: String[] = ['123', '123', '123', '123', '123', '123', '123', '123', '123', '123'];

    do {
        let executed = re.exec('123 456 789');
        if (executed !== null) {
            matched.push(executed[0]!);
        } else {
            break;
        }
    } while (matched.length < 10);

        arktest.assertEQ(expected.length, matched.length,
        'The value of expected.length is expected to equal the value of matched.length');
    for (let index = 0; index < expected.length; index++) {
                arktest.assertEQ(expected[index], matched[index],
            'The value of expected[index] is expected to equal the value of matched[index]');
    }
}