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

// arktsid: assertion_begin_04
// description: Execute /^p[b-z]/m.exec("pairs\nmakes\tdouble\npesos") and check results
// Conversion notes:
//  - With the m (multiline) flag, ^ anchors to each line start. At index 0 "pa"
//    fails [b-z], so the match is "pe" at index 19 (start of the "pesos" line),
//    proving ^ matches a line start rather than only the input start.

function main(): void {
    let r: RegExp = new RegExp('^p[b-z]', 'm');
    arktest.assertTrue(r.test('pairs\nmakes\tdouble\npesos'));
    let result: RegExpExecArray | null = r.exec('pairs\nmakes\tdouble\npesos');
    if (result != null) {
        arktest.assertEQ(result[0], 'pe', 'matched text at line start');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}