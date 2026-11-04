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
// arktsid: assertion_begin_05
// description: Execute /^[^p]/m.exec("pairs\nmakes\tdouble\npesos") and check the match length, index and input

function main(): void {
    let r: RegExp = new RegExp('^[^p]', 'm');
    let arr: RegExpExecArray | null = r.exec('pairs\nmakes\tdouble\npesos');
    if (arr != null) {
        arktest.assertEQ(arr.length, 1, 'match length');
        arktest.assertEQ(arr.index, 6, 'match index');
        arktest.assertEQ(arr.input, 'pairs\nmakes\tdouble\npesos', 'match input');
        arktest.assertEQ(arr[0], 'm', 'match[0]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}