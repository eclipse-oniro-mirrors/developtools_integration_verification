/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: exec_match_04
// description: String coerces to "abcdefghi" and RegExp is /a[a-z]{2,4}?/

function main(): void {
    // ToString coerces the object argument (toString returns "abcdefghi") to "abcdefghi";
    // the non-greedy quantifier {2,4}? matches the minimum two chars, so the match is "abc".
    let executed: RegExpExecArray | null = new RegExp('a[a-z]{2,4}?').exec('abcdefghi');
    if (executed == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(executed.length, 1, 'length');
    arktest.assertEQ(executed.index, 0, 'index');
    arktest.assertEQ(executed.input, 'abcdefghi', 'input');
    arktest.assertEQ(executed[0], 'abc', 'element 0');
}