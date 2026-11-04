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

// arktsid: constructor_tostring_06
// description: Pattern is 1 and flags is new Object("gi")

function main(): void {
    let r: RegExp = new RegExp('1', 'gi');
    arktest.assertEQ(r.ignoreCase, true, 'ignoreCase');
    arktest.assertEQ(r.multiline, false, 'multiline');
    arktest.assertEQ(r.global, true, 'global');
    arktest.assertEQ(r.lastIndex, 0, 'lastIndex');
    arktest.assertNE(typeof r.source, 'undefined', 'source not undefined');
}