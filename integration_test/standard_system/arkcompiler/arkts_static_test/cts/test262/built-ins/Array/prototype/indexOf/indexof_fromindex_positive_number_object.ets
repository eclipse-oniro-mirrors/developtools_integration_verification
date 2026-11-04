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

// arktsid: indexof_fromindex_positive_number_object
// description: Array.prototype.indexOf - value of 'fromIndex' is a number (value is positive number)
// Conversion notes:
//  - Object target {} replaced with new Object(). Arrays typed Array<Object> so the int
//    literals are boxed; indexOf compares boxed Integer vs the Object target by reference,
//    matching the original strict-equality behavior.
//  - fromIndex 2 (>= len - 1) means the target at index 1 is not reached (-1), while a
//    target stored exactly at index 2 is found (2).

function main(): void {
    let targetObj: Object = {};
    let a: Object[] = [0, targetObj, 2];
    arktest.assertEQ(a.indexOf(targetObj, 2), -1, '[0, targetObj, 2].indexOf(targetObj, 2)');
    let b: Object[] = [0, 1, targetObj];
    arktest.assertEQ(b.indexOf(targetObj, 2), 2, '[0, 1, targetObj].indexOf(targetObj, 2)');
}