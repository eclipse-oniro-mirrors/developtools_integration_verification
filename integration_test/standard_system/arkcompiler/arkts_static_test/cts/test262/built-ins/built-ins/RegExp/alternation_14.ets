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

// arktsid: alternation_14
// description: Execute /.+: gr(a|e)y/.exec("color: grey") and check index/input/length/element results
// Conversion notes:
//  - regex literal rewritten as new RegExp(".+: gr(a|e)y"); the alternation captures "e", so the match
//    array is ["color: grey", "e"].

function main(): void {
    let r: RegExp = new RegExp('.+: gr(a|e)y');
    let result: RegExpExecArray | null = r.exec('color: grey');
    if (result != null) {
        arktest.assertEQ(result.length, 2, 'length');
        arktest.assertEQ(result.index, 0, 'index');
        arktest.assertEQ(result.input, 'color: grey', 'input');
        arktest.assertEQ(result[0], 'color: grey', 'element 0');
        arktest.assertEQ(result[1], 'e', 'element 1');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}