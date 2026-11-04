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

// arktsid: last_index_of_object_reference_match
// description: Array.prototype.lastIndexOf - both array element and search element are Objects, and they refer to the
// same object
// Conversion notes:
// - Object literals `{}` replaced with `new Object()` (matches the existing isarray_object.ets pattern; ArkTS does not
// support untyped object literals).
// - lastIndexOf uses strict equality (===), i.e. reference equality for objects; obj3 === obj2, so the match is at
// index
// 0.

function main(): void {
    let obj1: Object = {};
    let obj2: Object = {};
    let obj3: Object = obj2;
    let arr: Object[] = [obj2, obj1];
    arktest.assertEQ(arr.lastIndexOf(obj3), 0, '[obj2, obj1].lastIndexOf(obj3)');
}