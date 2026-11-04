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

// arktsid: quantifier_repeat_04
// description: Execute /(z)((a+)?(b+)?(c))*/.exec("zaacbbbcac") and check results
// Conversion notes:
//  - regex literal rewritten as new RegExp("(z)((a+)?(b+)?(c))*"); group 4 (b+) does not
//    participate in the final repeat iteration, so __executed[4] is undefined

function main(): void {
    let r: RegExp = new RegExp('(z)((a+)?(b+)?(c))*');
    let m = r.exec('zaacbbbcac');
    arktest.assertEQ(m!.length, 6, '__executed.length');
    arktest.assertEQ(m!.index, 0, '__executed.index');
    arktest.assertEQ(m!.input, 'zaacbbbcac', '__executed.input');
    arktest.assertEQ(m![0], 'zaacbbbcac', '__executed[0]');
    arktest.assertEQ(m![1], 'z', '__executed[1]');
    arktest.assertEQ(m![2], 'ac', '__executed[2]');
    arktest.assertEQ(m![3], 'a', '__executed[3]');
    arktest.assertTrue(m![4] === undefined, '__executed[4] is undefined');
    arktest.assertEQ(m![5], 'c', '__executed[5]');
}