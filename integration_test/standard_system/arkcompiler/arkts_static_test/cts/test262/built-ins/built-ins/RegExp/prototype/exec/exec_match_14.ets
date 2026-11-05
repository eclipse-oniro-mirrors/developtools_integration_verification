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
// arktsid: exec_match_14
// description: String is new Boolean and RegExp is /AL|se/
// Conversion notes: ToString(new Boolean) coerces to "false"; the string "false" is matched directly.

function main(): void {
    let r = new RegExp('AL|se');
    let m = r.exec('false');
    arktest.assertTrue(m != null, 'exec result should be an array');
    arktest.assertEQ(m!.length, 1, 'match array length');
    arktest.assertEQ(m![0], 'se', 'matched substring');
    arktest.assertEQ(m!.index, 3, 'match index');
    arktest.assertEQ(m!.input, 'false', 'match input');
}