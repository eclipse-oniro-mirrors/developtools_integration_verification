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

// arktsid: map_callbackfn_is_a_function
// description: Array.prototype.map - callbackfn is a function
// Conversion notes:
//  - Integer literals [11, 9] typed as Array<int>; result typed as Array<boolean>

function main(): void {
    let testResult: boolean[] = [11, 9].map((v: int): boolean => { return v > 10; });
    arktest.assertEQ(testResult.length, 2, 'testResult.length');
    arktest.assertEQ(testResult[0], true, 'testResult[0]');
    arktest.assertEQ(testResult[1], false, 'testResult[1]');
}