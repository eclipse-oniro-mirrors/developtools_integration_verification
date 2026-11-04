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

// arktsid: filter_returns_array_is_array
// description: Array.isArray(arg) returns true when arg is the returned array
// Conversion notes:
//  - The original callback `function() {}` returned undefined, relying on JS
//    ToBoolean coercion to false so the returned array is empty; replaced with
//    an explicit `return false`. The asserted behavior (Array.isArray(newArr)
//    is true) is unaffected.

function main(): void {
    let newArr: int[] = [11].filter((v: int): boolean => false);
    arktest.assertTrue(Array.isArray(newArr), 'Array.isArray(newArr) !== true');
}