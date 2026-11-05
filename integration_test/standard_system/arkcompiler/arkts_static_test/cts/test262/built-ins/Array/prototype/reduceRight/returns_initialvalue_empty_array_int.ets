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

// arktsid: returns_initialvalue_empty_array_int
// description: Array.prototype.reduceRight returns initialValue if 'length' is 0 and initialValue is present (empty
// array)

function main(): void {
    let arr: int[] = [];
    let r: int = arr.reduceRight<int>((prev: int, cur: int): int => { return 0; }, 1);
    arktest.assertEQ(r, 1, '[].reduceRight(cb, 1) returns initialValue');
}