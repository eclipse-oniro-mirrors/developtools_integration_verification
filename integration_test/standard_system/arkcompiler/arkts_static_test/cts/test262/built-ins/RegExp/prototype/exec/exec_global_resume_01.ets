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
// arktsid: exec_global_resume_01
// description: RegExp is /(?:ab|cd)\d?/g and tested string is "ab  cd2  ab34  cd"

function main(): void {
    let re: RegExp = new RegExp('(?:ab|cd)\\d?', 'g');
    let matched: String[] = [];
    let expected: String[] = ['ab', 'cd2', 'ab3', 'cd'];

    do {
        let executed: RegExpExecArray | null = re.exec('ab  cd2  ab34  cd');
        if (executed !== null) {
            matched.push(executed[0]!);
        } else {
            break;
        }
    } while (true);

    arktest.assertEQ(expected.length, matched.length,
        'The value of expected.length is expected to equal the value of matched.length');

    for (let index = 0; index < expected.length; index++) {
        arktest.assertEQ(expected[index], matched[index],
            'The value of expected[index] is expected to equal the value of matched[index]');
    }
}