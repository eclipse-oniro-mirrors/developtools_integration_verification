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

// arktsid: quantifier_star_20
// description: Execute /.*/.exec('a1b2c3') and check results

function main(): void {
    let r: RegExp = new RegExp('.*');
    let result: RegExpExecArray | null = r.exec('a1b2c3');
    if (result == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(result.length, 1, '__executed.length');
    arktest.assertEQ(result.index, 0, '__executed.index');
    arktest.assertEQ(result.input, 'a1b2c3', '__executed.input');
    arktest.assertEQ(result[0], 'a1b2c3', '__executed[0]');
}