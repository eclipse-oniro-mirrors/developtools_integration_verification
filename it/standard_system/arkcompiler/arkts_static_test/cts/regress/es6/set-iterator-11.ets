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
  const set = new Set<number>([1, 2, 3]);

  let iterator: IterableIterator<number> = set.keys();

  assertNumberArrayEquals([1, 2, 3], Array.from<number>(set.keys()));
  assertNumberArrayEquals([1, 2, 3], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));

  iterator = set.values();
  assertNumberArrayEquals([1, 2, 3], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));

  iterator = set.keys();
  iterator.next();
  assertNumberArrayEquals([2, 3], Array.from<number>(iterator));
  assertNumberArrayEquals([], Array.from<number>(iterator));

  iterator = set.values();
  const iterator2: IterableIterator<number> = set.values();

  set.delete(1);
  assertNumberArrayEquals([2, 3], Array.from<number>(iterator));

  set.add(4);
  assertNumberArrayEquals([2, 3, 4], Array.from<number>(iterator2));

  iterator = set.keys();
  set.add(1);
  assertNumberArrayEquals([2, 3, 4, 1], Array.from<number>(iterator));
}
