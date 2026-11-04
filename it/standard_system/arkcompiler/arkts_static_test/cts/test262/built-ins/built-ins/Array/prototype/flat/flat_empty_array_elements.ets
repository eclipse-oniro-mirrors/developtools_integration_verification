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

// arktsid: flat_empty_array_elements
// description: arrays with empty arrays elements

function main(): void {
    let a0: int[] = [];
    let r0: int[] = a0.flat<int>();
    arktest.assertEQ(r0.length, 0, '[].flat() must return [] length');

    let a1: int[][] = [[], []];
    let r1: int[] = a1.flat<int>();
    arktest.assertEQ(r1.length, 0, '[ [], [] ].flat() must return [] length');

    let a2: int[][] = [[], [1]];
    let r2: int[] = a2.flat<int>();
    arktest.assertEQ(r2.length, 1, '[ [], [1] ].flat() must return [1] length');
    arktest.assertEQ(r2[0], 1, '[ [], [1] ].flat() must return [1] [0]');
}