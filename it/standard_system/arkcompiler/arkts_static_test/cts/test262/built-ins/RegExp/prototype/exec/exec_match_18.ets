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
// arktsid: exec_match_18
// description: String is undefined and RegExp is /nd|ne/
// Conversion notes: RegExp.exec(string) coerces the argument via ToString; undefined becomes 'undefined'.

function main(): void {
    let r = new RegExp('nd|ne');
    let m = r.exec('undefined');
    arktest.assertEQ(m![0], 'nd');
    arktest.assertEQ(m!.index, 1);
    arktest.assertEQ(m!.input, 'undefined');
    arktest.assertEQ(m!.length, 1);
}