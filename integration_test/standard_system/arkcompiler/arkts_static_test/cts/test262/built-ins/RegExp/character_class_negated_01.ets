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

// arktsid: character_class_negated_01
// description: Execute /[^]a/m.exec("a\naba") and check results - negated empty class matches any char including
// newline
// description: Execute /[^]a/m.exec("a\naba") and check results - negated empty class matches any char including
// newline
// Conversion notes: [^] (negated empty class) matches any character including newline, with m flag.

function main(): void {
    let r: RegExp = new RegExp('[^]a', 'm');
    let executed: RegExpExecArray | null = r.exec('a\naba');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1);
        arktest.assertEQ(executed.index, 1);
        arktest.assertEQ(executed.input, 'a\naba');
        arktest.assertEQ(executed[0], '\na');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}