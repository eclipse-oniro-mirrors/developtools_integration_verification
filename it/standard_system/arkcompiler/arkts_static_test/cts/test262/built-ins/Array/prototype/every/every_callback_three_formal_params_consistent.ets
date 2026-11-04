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

// arktsid: every_callback_three_formal_params_consistent
// description: Array.prototype.every - callbackfn is called with 3 formal parameters (value, index, array are
// consistent)
// Conversion notes:
//  - obj[idx] === val became a[i] === v under the typed predicate
//  - Mutable called counter declared as int and incremented inside the callback
//  - Integer literals [11, 12, 13] typed as Array<int>

function main(): void {
    let called: int = 0;
    let arr: int[] = [11, 12, 13];
    let result: boolean = arr.every((v: int, i: int, a: int[]): boolean => {
        called++;
        return v > 10 && a[i] === v;
    });
    arktest.assertEQ(result, true, '[11, 12, 13].every(callbackfn) !== true');
    arktest.assertEQ(called, 3, 'called');
}