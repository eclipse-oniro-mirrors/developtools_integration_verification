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

// arktsid: last_index_of_self_reference
// description: Array.prototype.lastIndexOf must return correct index when the array references itself
// Conversion notes:
// - `var a = new Array(0,1,2,3); a[2] = a;` holds a reference to the array itself. The ArkTS array is typed
// Array<Object> so `a[2] = a` is legal (Array<Object> is an Object).
// - lastIndexOf uses strict equality, i.e. reference equality for objects, so a[2] === a matches at index 2; boxed int
// elements compare by value (lastIndexOf(3) == 3).

function main(): void {
    let a: Object[] = [0, 1, 2, 3];
    a[2] = a;
    arktest.assertEQ(a.lastIndexOf(a), 2, 'a.lastIndexOf(a)');
    arktest.assertEQ(a.lastIndexOf(3), 3, 'a.lastIndexOf(3)');
}