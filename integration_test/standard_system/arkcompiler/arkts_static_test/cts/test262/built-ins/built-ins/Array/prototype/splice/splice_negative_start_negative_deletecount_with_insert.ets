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

// arktsid: splice_negative_start_negative_deletecount_with_insert
// description: -length = start < deleteCount < 0, itemCount > 0

function main(): void {
    let x: int[] = [0, 1];
    let arr: int[] = x.splice(-2, -1, 2, 3);
    arktest.assertEQ(arr.length, 0, 'arr.length === 0');
    arktest.assertEQ(x.length, 4, 'x.length === 4');
    arktest.assertEQ(x[0], 2, 'x[0] === 2');
    arktest.assertEQ(x[1], 3, 'x[1] === 3');
    arktest.assertEQ(x[2], 0, 'x[2] === 0');
    arktest.assertEQ(x[3], 1, 'x[3] === 1');
}