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

// arktsid: last_index_of_negative_zero_matches_positive_zero
// description: Array.prototype.lastIndexOf - array element is -0 and search element is +0
// Conversion notes:
//  - -0 is -0.0 and +0 is 0.0. lastIndexOf uses strict equality (===); -0 === +0, so the search matches at index 0.

function main(): void {
    let arr: number[] = [-0.0];
    arktest.assertEQ(arr.lastIndexOf(0.0), 0, '[-0].lastIndexOf(+0)');
}