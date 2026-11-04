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

// arktsid: every_callbackfn_return_global_object
// description: Array.prototype.every - return value of callbackfn is the global object
// Conversion notes:
//  - JS callback returns the truthy global object (via `var global = this`); ArkTS has
//    no module-level global object and the every predicate requires boolean, so mapped
//    to `return true`. The asserted outcomes (every returns true, callback accessed)
//    are unchanged.
//  - Element [11] typed as Array<int>.

function main(): void {
    let accessed: boolean = false;
    let result: boolean = [11].every((val: int, idx: int, arr: int[]): boolean => {
        accessed = true;
        return true;
    });
    arktest.assertEQ(result, true, '[11].every(callbackfn) !== true');
    arktest.assertEQ(accessed, true, 'accessed !== true');
}