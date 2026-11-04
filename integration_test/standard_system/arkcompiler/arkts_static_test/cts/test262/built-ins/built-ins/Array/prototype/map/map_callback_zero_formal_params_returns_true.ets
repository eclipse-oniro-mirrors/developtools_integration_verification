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

// arktsid: map_callback_zero_formal_params_returns_true
// description: Array.prototype.map - callbackfn is called with 0 formal parameter
// Conversion notes:
//  - Original callbackfn declared 0 formal parameters; represented in ArkTS with
//    the typed callback signature (value: int) => boolean where the value
//    parameter is unused. The core assertion (the mapped value is true) is
//    preserved.
//  - Integer literal [11] typed as Array<int>; result typed as Array<boolean>

function main(): void {
    let testResult: boolean[] = [11].map((v: int): boolean => { return true; });
    arktest.assertEQ(testResult[0], true, 'testResult[0]');
}