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

// arktsid: every_empty_array_returns_true
// description: Array.prototype.every returns true when 'length' is 0 (empty array)
// Conversion notes:
//  - The original callback `function cb() {}` returns undefined, relying on the
//    fact that every short-circuits to true on a zero-length array without ever
//    invoking the callback. The callback body is therefore irrelevant; it is
//    written as a typed predicate returning true and a captured flag confirms it
//    is never called.

function main(): void {
    let called: boolean = false;
    let arr: int[] = [];
    let i: boolean = arr.every((_v: int): boolean => {
        called = true;
        return true;
    });
    arktest.assertEQ(called, false, 'callback not invoked on empty array');
    arktest.assertEQ(i, true, 'i');
}