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

// arktsid: backreference_03
// description: DecimalEscape \1 matches the result of the first capturing group, with an optional [A-H]{2} group
// captured

function main(): void {
    let r: RegExp = new RegExp('([xu]\\d{2}([A-H]{2})?)\\1');
    let arr: RegExpExecArray | null = r.exec('x09x12x01x05u00FFu00FFx04x04x23');
    if (arr != null) {
        arktest.assertEQ(arr.length, 3, 'length');
        arktest.assertEQ(arr.index, 12, 'index');
        arktest.assertEQ(arr.input, 'x09x12x01x05u00FFu00FFx04x04x23', 'input');
        arktest.assertEQ(arr[0], 'u00FFu00FF', 'match[0]');
        arktest.assertEQ(arr[1], 'u00FF', 'match[1]');
        arktest.assertEQ(arr[2], 'FF', 'match[2]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}