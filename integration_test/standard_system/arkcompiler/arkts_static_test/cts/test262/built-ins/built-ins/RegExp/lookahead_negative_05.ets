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
// arktsid: lookahead_negative_05
// description: Execute /Java(?!Script)([A-Z]\w*)/.exec("JavaScr oops ipt ") and check results
// Conversion notes:
//  - negative lookahead (?!Script) is zero-width: it fails when "Script" matches at the current
//    position, so "JavaScr" (not "JavaScript") is matched and capture group 1 is "Scr".

function main(): void {
    let m: RegExpExecArray | null = new RegExp('Java(?!Script)([A-Z]\\w*)').exec('JavaScr oops ipt ');
    arktest.assertTrue(m != null, 'exec should match');
    arktest.assertEQ(m!.length, 2, 'length');
    arktest.assertEQ(m!.index, 0, 'index');
    arktest.assertEQ(m!.input, 'JavaScr oops ipt ', 'input');
    arktest.assertEQ(m![0], 'JavaScr', 'element 0');
    arktest.assertEQ(m![1], 'Scr', 'element 1');
}