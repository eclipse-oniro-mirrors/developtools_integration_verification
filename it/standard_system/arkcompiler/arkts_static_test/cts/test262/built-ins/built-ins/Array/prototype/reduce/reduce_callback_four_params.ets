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

// arktsid: reduce_callback_four_params
// description: Array.prototype.reduce - callbackfn is called with 4 formal parameter

function main(): void {
    let result: boolean = false;
    let arr: int[] = [11];
    let r: int = arr.reduce<int>((prev: int, cur: int, idx: int, a: int[]): int => {
        result = (prev === 1 && a[idx] === cur);
        return cur;
    }, 1);
    arktest.assertTrue(result, 'result !== true');
}