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

// arktsid: indexof_fromindex_plus_zero_finds_element
// description: Array.prototype.indexOf - value of 'fromIndex' is a number (value is +0)
// Conversion notes:
//  - fromIndex is int in ArkTS (no +0/-0 distinction); +0 written as 0, result identical.

function main(): void {
    let x: boolean[] = [true];
    arktest.assertEQ(x.indexOf(true, 0), 0, '[true].indexOf(true, +0)');
}