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
// arktsid: quantifier_optional_11
// description: Execute /\??\??\??\??\??/.exec("?????") and check results
// Conversion notes:
//  - Each \?? matches an optional literal '?', repeated five times, so the pattern matches "?????" at index 0.

function main(): void {
    let r: RegExp = new RegExp('\\??\\??\\??\\??\\??');
    let arr: RegExpExecArray | null = r.exec('?????');
    if (arr != null) {
        arktest.assertEQ(arr.length, 1, 'match length');
        arktest.assertEQ(arr.index, 0, 'match index');
        arktest.assertEQ(arr.input, '?????', 'match input');
        arktest.assertEQ(arr[0], '?????', 'full match');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}