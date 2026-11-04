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
// arktsid: alternation_11
// description: The | regular expression operator separates two alternatives
// Conversion notes:
//  - Alternation tries the left alternative first; "11111|111" matches the longest alternative "11111".

function main(): void {
    let r: RegExp = new RegExp('11111|111');
    let m = r.exec('1111111111111111');
    arktest.assertTrue(m !== null);
    if (m !== null) {
        arktest.assertEQ(m.length, 1, 'length');
        arktest.assertEQ(m.index, 0, 'index');
        arktest.assertEQ(m.input, '1111111111111111', 'input');
        arktest.assertEQ(m[0], '11111', '[0]');
    }
}