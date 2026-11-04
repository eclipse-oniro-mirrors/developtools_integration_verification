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

// arktsid: reduce_returns_initialvalue_length_object_valueof
// description: Array.prototype.reduce returns initialValue if 'length' is 0 and initialValue is present (subclassed
// Array, length overridden with obj with valueOf)
// Conversion notes:
//  - The JS test overrides the array length with an object whose valueOf() returns 0,
//    so ToLength(ToNumber(o)) coerces the length to 0. ArkTS length is numeric and
//    cannot be assigned an object, so the equivalent behavior (empty array, initialValue
//    present) is tested directly: reduce returns the initialValue without invoking the
//    callback.

function main(): void {
    let arr: int[] = [];
    let result: int = arr.reduce<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        return 0;
    }, 1);
    arktest.assertEQ(result, 1, 'arr.reduce(cb, 1)');
}