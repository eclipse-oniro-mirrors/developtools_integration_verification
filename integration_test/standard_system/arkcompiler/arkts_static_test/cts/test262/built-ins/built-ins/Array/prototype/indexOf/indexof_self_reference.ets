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

// arktsid: indexof_self_reference
// description: Array.prototype.indexOf must return correct index (self reference)
// Conversion notes:
//  - Source `var a = new Array(0, 1, 2, 3)` rewritten as Array<Object>; a[2] = a stores the
//    array in itself, so a.indexOf(a) finds it at index 2 via reference equality.
//  - a.indexOf(3) still finds the boxed Integer 3 at index 3 (boxed primitives compare by value).

function main(): void {
    let a: Object[] = [0, 1, 2, 3];
    a[2] = a;
    arktest.assertEQ(a.indexOf(a), 2, 'a.indexOf(a)');
    arktest.assertEQ(a.indexOf(3), 3, 'a.indexOf(3)');
}