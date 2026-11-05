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

// arktsid: indexof_object_reference_match
// description: Array.prototype.indexOf - both array element and search element are Object type, and they refer to the
// same object
// Conversion notes:
//  - Source object literals {} replaced with new Object() (distinct instances). obj3 aliases obj2,
//    so indexOf finds it at index 2 via reference equality (===).

function main(): void {
    let obj1: Object = {};
    let obj2: Object = {};
    let obj3: Object = obj2;
    let x: Object[] = [{}, obj1, obj2];
    arktest.assertEQ(x.indexOf(obj3), 2, '[{}, obj1, obj2].indexOf(obj3)');
}