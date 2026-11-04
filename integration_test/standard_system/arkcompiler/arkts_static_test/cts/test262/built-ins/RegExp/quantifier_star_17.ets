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
// arktsid: quantifier_star_17
// description: Execute /x*y+$/.exec('xxxxxxyyyyyy') and check results

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('x*y+$').exec('xxxxxxyyyyyy');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1, 'length');
        arktest.assertEQ(executed.index, 0, 'index');
        arktest.assertEQ(executed.input, 'xxxxxxyyyyyy', 'input');
        arktest.assertEQ(executed[0], 'xxxxxxyyyyyy', 'matched substring');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}