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

function assertNumberArrayEquals(expected: number[], actual: number[]): void {
  arktest.assertEQ(expected.length, actual.length);
  for (let i: int = 0; i < expected.length; i++) {
    arktest.assertEQ(expected[i], actual[i]);
  }
}

function main(): void {
  const map = new Map<number, number>([[1, 2], [2, 3], [3, 4]]);

  let iterator: IterableIterator<number> = map.keys();
  assertNumberArrayEquals([1, 2, 3], Array.from<number>(map.keys()));
  assertNumberArrayEquals([1, 2, 3], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));

  iterator = map.values();
  assertNumberArrayEquals([2, 3, 4], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));

  iterator = map.keys();
  iterator.next();
  assertNumberArrayEquals([2, 3], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));

  iterator = map.values();
  const iterator2: IterableIterator<number> = map.values();

  map.delete(1);
  assertNumberArrayEquals([3, 4], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));

  map.set(1, 5);
  assertNumberArrayEquals([3, 4, 5], Array.from<number>(iterator2));
  assertNumberArrayEquals([], Array.from<number>(iterator2));

  iterator = map.keys();
  map.set(4, 6);
  assertNumberArrayEquals([2, 3, 1, 4], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));
}
