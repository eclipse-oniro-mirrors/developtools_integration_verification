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

// arktsid: some_subclassed_length_zero_empty_array
// description: Array.prototype.some returns false if 'length' is 0 (subclassed Array, length overridden with [])
// Conversion notes:
//  - JS prototype-based subclassing (foo.prototype = new Array(1,2,3); new foo()) is not supported in ArkTS.
// - The length override `f.length = []` ToPrimitive-coerces through Array.prototype.toString ("" -> 0); ArkTS length
// takes an int, so the coercion result 0 is assigned directly.

function main(): void {
    let called: boolean = false;
    let arr: int[] = [1, 2, 3];
    arr.length = 0;
    let i: boolean = arr.some((val: int): boolean => {
        called = true;
        return true;
    });
    arktest.assertEQ(i, false, 'i');
    arktest.assertEQ(called, false, 'callback not invoked on zero-length array');
}