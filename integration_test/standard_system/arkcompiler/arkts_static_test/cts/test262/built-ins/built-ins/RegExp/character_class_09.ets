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

// arktsid: character_class_09
// description: Execute /[1234567].{2}/.exec("abc6defghijkl") and check index/input/length/element results

function main(): void {
    let r: RegExp = new RegExp('[1234567].{2}');
    let result: RegExpExecArray | null = r.exec('abc6defghijkl');
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 3, 'index');
        arktest.assertEQ(result.input, 'abc6defghijkl', 'input');
        arktest.assertEQ(result[0], '6de', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}