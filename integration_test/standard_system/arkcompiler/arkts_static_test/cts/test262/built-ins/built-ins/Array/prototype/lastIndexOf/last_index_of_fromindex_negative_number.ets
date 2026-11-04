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

// arktsid: last_index_of_fromindex_negative_number
// description: Array.prototype.lastIndexOf - value of 'fromIndex' is a negative number
// Conversion notes:
// - Source used float fromIndex -2.5; ToInteger(-2.5) = -2. ArkTS lastIndexOf requires an int fromIndex, so -2 is used;
// the computed start index (max(3-2,0)=1) is identical, results unchanged.
// - Object literal `{}` replaced with `new Object()`; the heterogeneous literal [0, {}, true] is typed as
// Array<Object>.

function main(): void {
    let targetObj: Object = {};
    let a: Object[] = [0, targetObj, true];
    arktest.assertEQ(a.lastIndexOf(targetObj, -2), 1, '[0,targetObj,true].lastIndexOf(targetObj,-2)');
    let b: Object[] = [0, true, targetObj];
    arktest.assertEQ(b.lastIndexOf(targetObj, -2), -1, '[0,true,targetObj].lastIndexOf(targetObj,-2)');
}