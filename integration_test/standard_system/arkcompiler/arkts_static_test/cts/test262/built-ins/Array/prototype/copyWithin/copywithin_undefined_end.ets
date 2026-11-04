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

// arktsid: copywithin_undefined_end
// description: If end is undefined, set final position to this.length.

function main(): void {
    let a1: int[] = [0, 1, 2, 3];
    let r1: int[] = a1.copyWithin(0, 1);
    arktest.assertEQ(r1.length, 4, '[0,1,2,3].copyWithin(0,1) [end undefined] length === 4');
    arktest.assertEQ(r1[0], 1, '[0,1,2,3].copyWithin(0,1) [end undefined] [0] === 1');
    arktest.assertEQ(r1[1], 2, '[0,1,2,3].copyWithin(0,1) [end undefined] [1] === 2');
    arktest.assertEQ(r1[2], 3, '[0,1,2,3].copyWithin(0,1) [end undefined] [2] === 3');
    arktest.assertEQ(r1[3], 3, '[0,1,2,3].copyWithin(0,1) [end undefined] [3] === 3');

    let a2: int[] = [0, 1, 2, 3];
    let r2: int[] = a2.copyWithin(0, 1);
    arktest.assertEQ(r2.length, 4, '[0,1,2,3].copyWithin(0,1) [end omitted] length === 4');
    arktest.assertEQ(r2[0], 1, '[0,1,2,3].copyWithin(0,1) [end omitted] [0] === 1');
    arktest.assertEQ(r2[1], 2, '[0,1,2,3].copyWithin(0,1) [end omitted] [1] === 2');
    arktest.assertEQ(r2[2], 3, '[0,1,2,3].copyWithin(0,1) [end omitted] [2] === 3');
    arktest.assertEQ(r2[3], 3, '[0,1,2,3].copyWithin(0,1) [end omitted] [3] === 3');
}