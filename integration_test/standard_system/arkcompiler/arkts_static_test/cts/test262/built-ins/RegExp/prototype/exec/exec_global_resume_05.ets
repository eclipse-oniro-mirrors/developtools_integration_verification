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
// arktsid: exec_global_resume_05
// description: RegExp is /\d+/g and tested string is "123 456 789"

function main(): void {
    let re: RegExp = new RegExp('\\d+', 'g');
    let matched: String[] = [];
    let expected: String[] = ['123', '456', '789'];

    do {
        let executed: RegExpExecArray | null = re.exec('123 456 789');
        if (executed !== null) {
            matched.push(executed[0]!);
        } else {
            break;
        }
    } while (true);

    arktest.assertEQ(matched.length, expected.length,
        'The value of expected.length is expected to equal the value of matched.length');
    for (let index = 0; index < expected.length; index++) {
        arktest.assertEQ(matched[index], expected[index],
            'The value of expected[index] is expected to equal the value of matched[index]');
    }
}