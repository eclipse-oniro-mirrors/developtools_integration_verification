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

// arktsid: length_assign_negative_throws_rangeerror
// description: Assigning a negative Array.length throws RangeError
// Conversion notes:
//  - JS `x.length = -1` throws RangeError; ArkTS length setter throws
//    RangeError("can't change length to bigger or negative") for len < 0.
//    The 4294967296 (Long) and 1.5 (double) cases are compile-negative,
//    covered by length_assign_uint32_max_n.ets / length_assign_nan_n.ets.

function main(): void {
    let x: int[] = [];

    arktest.expectThrow((): void => {
        x.length = -1;
    }, (e: Error): boolean => e.name === 'RangeError');
}