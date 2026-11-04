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

// arktsid: assertion_begin_10
// description: Execute /^\d+/m.exec("abc\n123xyz") and check results - multiline ^ matches at each line start
// Conversion notes: with m flag, ^ matches at the start of each line; here \d+ matches "123" starting at index 4.

function main(): void {
    let r: RegExp = new RegExp('^\\d+', 'm');
    let executed: RegExpExecArray | null = r.exec('abc\n123xyz');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1);
        arktest.assertEQ(executed.index, 4);
        arktest.assertEQ(executed.input, 'abc\n123xyz');
        arktest.assertEQ(executed[0], '123');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}