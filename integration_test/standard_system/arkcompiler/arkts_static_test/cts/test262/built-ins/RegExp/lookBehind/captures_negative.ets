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

// arktsid: captures_negative
// description: Captures inside a negative lookbehind never capture
// Conversion notes: the capture group inside a negative lookbehind never
//   participates, so match()[1] is undefined (not empty string).

function main(): void {
    let re: RegExp = new RegExp('(?<!(^|[ab]))\\w{2}');
    let result: RegExpMatchArray | null = re.match('abcdef');
    if (result != null) {
        arktest.assertEQ(result.length, 2, 'match array has whole match + one capture group');
        arktest.assertEQ(result[0], 'de', 'match[0] === \'de\'');
        arktest.assertEQ(result[1], undefined, 'match[1] === undefined (capture never captured)');
    } else {
        arktest.assertTrue(false, 'match should return a result for \'abcdef\'');
    }
}