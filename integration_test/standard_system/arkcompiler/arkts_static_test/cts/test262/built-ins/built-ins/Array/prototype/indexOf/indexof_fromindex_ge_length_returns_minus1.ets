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

// arktsid: indexof_fromindex_ge_length_returns_minus1
// description: Array.prototype.indexOf returns -1 if fromIndex is greater than Array length

function main(): void {
    let a: int[] = [1, 2, 3];
    let e: int[] = [];
    arktest.assertEQ(a.indexOf(1, 5), -1, 'a.indexOf(1,5)');
    arktest.assertEQ(a.indexOf(1, 3), -1, 'a.indexOf(1,3)');
    arktest.assertEQ(e.indexOf(1, 0), -1, '[ ].indexOf(1,0)');
}