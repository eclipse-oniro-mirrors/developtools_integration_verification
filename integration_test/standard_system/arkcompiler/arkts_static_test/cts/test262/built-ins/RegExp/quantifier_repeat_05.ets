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
// arktsid: quantifier_repeat_05
// description: An Atom followed by a Quantifier is repeated the number of times specified by the Quantifier -
// /(a*)b\1+/.exec("baaaac") returns ["b", ""] with index 0 and input "baaaac"

function main(): void {
    let r: RegExp = new RegExp('(a*)b\\1+');
    let arr: RegExpExecArray | null = r.exec('baaaac');
    if (arr != null) {
        let expected: String[] = ['b', ''];
        arktest.assertEQ(arr.length, expected.length, 'length');
        arktest.assertEQ(arr.index, 0, 'index');
        arktest.assertEQ(arr.input, 'baaaac', 'input');
        for (let i = 0; i < expected.length; i++) {
            arktest.assertEQ(arr[i], expected[i], 'element ' + i);
        }
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}