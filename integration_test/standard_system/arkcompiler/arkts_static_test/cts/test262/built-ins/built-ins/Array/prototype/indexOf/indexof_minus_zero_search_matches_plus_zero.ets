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

// arktsid: indexof_minus_zero_search_matches_plus_zero
// description: Array.prototype.indexOf - array element is +0 and search element is -0
// Conversion notes:
//  - indexOf uses strict equality (===); +0.0 === -0.0 in ArkTS, so searching for -0.0 matches the
//    +0.0 element at index 0. Used double literals 0.0 / -0.0 to preserve the +0 / -0 distinction.

function main(): void {
    let x: number[] = [0.0];
    arktest.assertEQ(x.indexOf(-0.0), 0, '[+0].indexOf(-0)');
}