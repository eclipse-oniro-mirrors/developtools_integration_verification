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

// arktsid: indexof_null_element_found
// description: Array.prototype.indexOf - both type of array element and type of search element are null
// Conversion notes:
//  - Used Array<Object | null> instead of Array<Object>: ArkTS null-safety makes Object non-nullable
//    by default, so | null is required to store a null element. indexOf(null) matches via === (null === null).

function main(): void {
    let x: (Object | null)[] = [null];
    arktest.assertEQ(x.indexOf(null), 0, '[null].indexOf(null)');
}