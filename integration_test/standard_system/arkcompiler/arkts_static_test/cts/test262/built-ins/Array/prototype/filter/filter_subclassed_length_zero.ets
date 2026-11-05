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

// arktsid: filter_subclassed_length_zero
// description: Array.prototype.filter returns an empty array if 'length' is 0 (subclassed Array, length overridden to 0
// (type conversion))
// Conversion notes:
//  - The JS test overrides the length of a prototype-subclassed array to 0, so filter()
//    returns an empty array. ArkTS has no JS prototype subclassing, so the equivalent
//    behavior is tested on an empty array literal.

function main(): void {
    let src: int[] = [];
    let a: int[] = src.filter((_v: int): boolean => {
        return true;
    });
    arktest.assertTrue(Array.isArray(a), 'Array.isArray(a) !== true');
    arktest.assertEQ(a.length, 0, 'a.length');
}