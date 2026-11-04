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

// arktsid: quantifier_plus_07
// description: QuantifierPrefix + returns 1 and infinity; exec of [a-z]+(\d+) checks full match and capture group

function main(): void {
    let r: RegExp = new RegExp('[a-z]+(\\d+)');
    let executed: RegExpExecArray | null = r.exec('x 2 ff 55 x2 as1 z12 abc12.0');
    if (executed != null) {
        arktest.assertEQ(executed.length, 2, 'length');
        arktest.assertEQ(executed.index, 10, 'index');
        arktest.assertEQ(executed.input, 'x 2 ff 55 x2 as1 z12 abc12.0', 'input');
        arktest.assertEQ(executed[0], 'x2', 'element 0');
        arktest.assertEQ(executed[1], '2', 'element 1');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}