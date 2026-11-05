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
// arktsid: failure_g_lastindex_reset
// description: lastIndex is read and reset to 0 when global is set and the match fails.

function main(): void {
    let r = new RegExp('a', 'g');

    // lastIndex beyond end of string
    r.lastIndex = 42;
    let result = r.exec('abc');
    arktest.assertEQ(result, null);
    arktest.assertEQ(r.lastIndex, 0);

    // No match
    r.lastIndex = 0;
    result = r.exec('nbc');
    arktest.assertEQ(result, null);
    arktest.assertEQ(r.lastIndex, 0);
}