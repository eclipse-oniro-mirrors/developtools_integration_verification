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

// arktsid: reverse_returns_same_array
// description: reverse reverses the array in place and returns the same array

function main(): void {
    let x: int[] = [];
    arktest.assertEQ(x.reverse(), x, 'reverse returns same array');

    let y: int[] = [1, 2];
    let rev: int[] = y.reverse();
    arktest.assertEQ(rev, y, 'reverse returns same array');
    arktest.assertEQ(y[0], 2, 'y[0]');
    arktest.assertEQ(y[1], 1, 'y[1]');
    arktest.assertEQ(y.length, 2, 'y.length');
}