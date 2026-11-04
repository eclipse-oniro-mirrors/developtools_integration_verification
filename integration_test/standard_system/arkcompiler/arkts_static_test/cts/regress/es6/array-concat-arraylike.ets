/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0127: No matching indexing signature for $_set(Symbol.isConcatSpreadable, Boolean)"
---*/

'use strict';
let obj: Record<string, Object> = {
  'length': 6,
  '1': 'A',
  '3': 'B',
  '5': 'C'
};
obj[Symbol.isConcatSpreadable] = true;
let obj2: Record<string, Object> = { length: 3, '0': '0', '1': '1', '2': '2' };
let arr: string[] = ['X', 'Y', 'Z'];
let concatResult = Array.prototype.concat.call(obj, obj2, arr);
arktest.assertEQ(9, concatResult.length);
arktest.assertEQ(undefined, concatResult[0]);
arktest.assertEQ('A', concatResult[1]);
arktest.assertEQ(undefined, concatResult[2]);
arktest.assertEQ('B', concatResult[3]);
arktest.assertEQ(undefined, concatResult[4]);
arktest.assertEQ('C', concatResult[5]);
arktest.assertEQ('0', concatResult[6]['0']);
arktest.assertEQ('X', concatResult[7]);
arktest.assertEQ('Y', concatResult[8]);
