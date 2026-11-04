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

function presentElementCount<T>(values: SparseArray<T>): int {
  let count: int = 0;
  values.forEach((_value: T, _index: int, _array: SparseArray<T>): void => {
    count++;
  });
  return count;
}

function main(): void {
  const holey: SparseArray<int> = new SparseArray<int>(10);
  holey[0] = 1;
  holey[1] = 2;
  holey[2] = 3;
  holey[3] = 4;
  holey[4] = 5;

  const oneHoleForStructure: SparseArray<int> = holey.slice(6, 7);
  arktest.assertEQ(1, oneHoleForStructure.length);
  arktest.assertEQ(0, presentElementCount(oneHoleForStructure));

  const oneHoleForRead: SparseArray<int> = holey.slice(6, 7);
  arktest.assertEQ(undefined, oneHoleForRead[0]);

  const empty: SparseArray<int> = holey.slice(2, 1);
  arktest.assertEQ(0, empty.length);
  arktest.assertEQ(0, presentElementCount(empty));

  const packed: SparseArray<int> = holey.slice(2, 3);
  arktest.assertEQ(3, packed[0]);
}
