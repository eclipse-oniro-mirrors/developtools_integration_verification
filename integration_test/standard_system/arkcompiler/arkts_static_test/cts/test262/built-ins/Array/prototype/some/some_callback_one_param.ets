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

// arktsid: some_callback_one_param
// description: Array.prototype.some - callbackfn is called with 1 formal parameter
// Conversion notes:
//  - Integer literals [11, 12] typed as Array<int>

function main(): void {
    let arr: int[] = [11, 12];
    let result: boolean = arr.some((v: int): boolean => { return v > 10; });
    arktest.assertEQ(result, true, '[11, 12].some(callbackfn)');
}