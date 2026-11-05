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
// arktsid: exec_match_12
// description: String is {toString:function(){return Math.PI;}} and RegExp is /\.14/

function main(): void {
    // The object {toString:function(){return Math.PI;}} is coerced to the string "3.141592653589793"
    let input: string = String(Math.PI);
    let m: RegExpExecArray | null = new RegExp('\\.14').exec(input);
    if (m == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(m.length, 1, 'length');
    arktest.assertEQ(m.index, 1, 'index');
    arktest.assertEQ(m.input, input, 'input');
    arktest.assertEQ(m[0], '.14', 'element 0');
}