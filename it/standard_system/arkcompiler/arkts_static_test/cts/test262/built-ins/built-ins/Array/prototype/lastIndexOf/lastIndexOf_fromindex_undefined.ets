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

// arktsid: lastIndexOf_fromindex_undefined
// description: Array.prototype.lastIndexOf when fromIndex is undefined
// Conversion notes:
// - fromIndex being undefined resolves to 0 (stdlib `fromIndex ?? 0`), matching JS ToInteger(undefined) = 0; omitting
// fromIndex defaults to the last index.

function main(): void {
    let a: int[] = [1, 2, 1];
    // undefined resolves to 0, no second argument resolves to len
    arktest.assertEQ(a.lastIndexOf(2, undefined), -1, 'a.lastIndexOf(2, undefined)');
    arktest.assertEQ(a.lastIndexOf(1, undefined), 0, 'a.lastIndexOf(1, undefined)');
    arktest.assertEQ(a.lastIndexOf(1), 2, 'a.lastIndexOf(1)');
}