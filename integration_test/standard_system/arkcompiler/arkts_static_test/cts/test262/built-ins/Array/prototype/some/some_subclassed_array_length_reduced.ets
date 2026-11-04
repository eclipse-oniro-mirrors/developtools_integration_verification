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

// arktsid: some_subclassed_array_length_reduced
// description: Array.prototype.some - subclassed array when length is reduced
// Conversion notes:
//  - JS prototype-based subclassing (foo.prototype = new Array(1,2,3); new foo()) is not supported in ArkTS.
//  - The length-reduction semantics are preserved with a plain Array<int> whose length setter shrinks [1,2,3] to [1,2].

function main(): void {
    let arr: int[] = [1, 2, 3];
    arr.length = 2;
    let i: boolean = arr.some((val: int): boolean => {
        if (val > 2) {
            return true;
        }
        return false;
    });
    arktest.assertEQ(i, false, 'i');
}