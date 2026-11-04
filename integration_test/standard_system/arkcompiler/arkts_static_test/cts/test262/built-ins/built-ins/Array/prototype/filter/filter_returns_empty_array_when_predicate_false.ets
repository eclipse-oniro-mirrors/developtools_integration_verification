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

// arktsid: filter_returns_empty_array_when_predicate_false
// description: Array.prototype.filter - returns an array whose length is 0
// Conversion notes:
//  - The original callback `function() {}` returned undefined, relying on JS
//    ToBoolean coercion to false; replaced with an explicit `return false`.
//    The asserted behavior (newArr.length === 0) is unaffected.

function main(): void {
    let newArr: int[] = [11].filter((v: int): boolean => false);
    arktest.assertEQ(newArr.length, 0, 'newArr.length');
}