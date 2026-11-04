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

// arktsid: every_own_length_overrides_inherited
// description: Array.prototype.every - 'length' is own data property that overrides an inherited data property on an
// Array
// Conversion notes:
//  - Integer literals [12, 11] typed as Array<int>

function main(): void {
    let arr: int[] = [12, 11];
    let r1: boolean = arr.every((v: int): boolean => { return v > 10; });
    arktest.assertEQ(r1, true, '[12, 11].every(callbackfn1) !== true');
    let r2: boolean = arr.every((v: int): boolean => { return v > 11; });
    arktest.assertEQ(r2, false, '[12, 11].every(callbackfn2)');
}