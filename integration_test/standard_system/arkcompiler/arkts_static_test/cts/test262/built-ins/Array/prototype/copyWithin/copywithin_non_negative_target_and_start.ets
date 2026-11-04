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

// arktsid: copywithin_non_negative_target_and_start
// description: Copy values with non-negative target and start positions.

function main(): void {
    let s1: string[] = ['a', 'b', 'c', 'd', 'e', 'f'];
    let r1: string[] = s1.copyWithin(0, 0);
    arktest.assertEQ(r1.length, 6, '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,0) length === 6');
    arktest.assertEQ(r1[0], 'a', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,0) [0] === \'a\'');
    arktest.assertEQ(r1[1], 'b', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,0) [1] === \'b\'');
    arktest.assertEQ(r1[2], 'c', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,0) [2] === \'c\'');
    arktest.assertEQ(r1[3], 'd', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,0) [3] === \'d\'');
    arktest.assertEQ(r1[4], 'e', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,0) [4] === \'e\'');
    arktest.assertEQ(r1[5], 'f', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,0) [5] === \'f\'');

    let s2: string[] = ['a', 'b', 'c', 'd', 'e', 'f'];
    let r2: string[] = s2.copyWithin(0, 2);
    arktest.assertEQ(r2.length, 6, '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,2) length === 6');
    arktest.assertEQ(r2[0], 'c', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,2) [0] === \'c\'');
    arktest.assertEQ(r2[1], 'd', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,2) [1] === \'d\'');
    arktest.assertEQ(r2[2], 'e', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,2) [2] === \'e\'');
    arktest.assertEQ(r2[3], 'f', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,2) [3] === \'f\'');
    arktest.assertEQ(r2[4], 'e', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,2) [4] === \'e\'');
    arktest.assertEQ(r2[5], 'f', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(0,2) [5] === \'f\'');

    let s3: string[] = ['a', 'b', 'c', 'd', 'e', 'f'];
    let r3: string[] = s3.copyWithin(3, 0);
    arktest.assertEQ(r3.length, 6, '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(3,0) length === 6');
    arktest.assertEQ(r3[0], 'a', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(3,0) [0] === \'a\'');
    arktest.assertEQ(r3[1], 'b', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(3,0) [1] === \'b\'');
    arktest.assertEQ(r3[2], 'c', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(3,0) [2] === \'c\'');
    arktest.assertEQ(r3[3], 'a', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(3,0) [3] === \'a\'');
    arktest.assertEQ(r3[4], 'b', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(3,0) [4] === \'b\'');
    arktest.assertEQ(r3[5], 'c', '[\'a\',\'b\',\'c\',\'d\',\'e\',\'f\'].copyWithin(3,0) [5] === \'c\'');

    let a4: int[] = [0, 1, 2, 3, 4, 5];
    let r4: int[] = a4.copyWithin(1, 4);
    arktest.assertEQ(r4.length, 6, '[0,1,2,3,4,5].copyWithin(1,4) length === 6');
    arktest.assertEQ(r4[0], 0, '[0,1,2,3,4,5].copyWithin(1,4) [0] === 0');
    arktest.assertEQ(r4[1], 4, '[0,1,2,3,4,5].copyWithin(1,4) [1] === 4');
    arktest.assertEQ(r4[2], 5, '[0,1,2,3,4,5].copyWithin(1,4) [2] === 5');
    arktest.assertEQ(r4[3], 3, '[0,1,2,3,4,5].copyWithin(1,4) [3] === 3');
    arktest.assertEQ(r4[4], 4, '[0,1,2,3,4,5].copyWithin(1,4) [4] === 4');
    arktest.assertEQ(r4[5], 5, '[0,1,2,3,4,5].copyWithin(1,4) [5] === 5');
}