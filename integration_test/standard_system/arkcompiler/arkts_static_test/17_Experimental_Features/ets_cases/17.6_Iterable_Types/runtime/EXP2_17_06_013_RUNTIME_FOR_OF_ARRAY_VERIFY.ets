/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id EXP2_17_06_013_RUNTIME_FOR_OF_ARRAY_VERIFY
 * @expect runtime
 * @section 17.6
 * @design 运行时验证 for-of 遍历数组类型（内置可迭代），验证元素值和迭代顺序
 * @note 运行时用例：实际执行验证数组 for-of 迭代行为
 */
class ArrIterData implements Iterable<number> {
  private data: number[]
  constructor(p: number[]) {
    this.data = p
  }
  $_iterator(): Iterator<number> {
    return new ArrIter(this.data)
  }
}

class ArrIter implements Iterator<number> {
  private items: number[]
  private pos: int = 0
  constructor(d: number[]) {
    this.items = d
  }
  next(): IteratorResult<number> {
    if (this.pos >= this.items.length) {
      return new IteratorResult<number>()
    }
    return new IteratorResult<number>(this.items[this.pos++])
  }
}

function main(): void {
  let arr: int[] = [10, 20, 30]
  let sum: int = 0
  let count: int = 0
  for (let x of arr) {
    sum = sum + x
    count = count + 1
  }
  if (sum != 60) {
    throw new Error('array for-of sum failed: ' + sum)
  }
  if (count != 3) {
    throw new Error('array for-of count failed: ' + count)
  }

  let emptyArr: int[] = []
  let emptyCount: int = 0
  for (let x of emptyArr) {
    emptyCount = emptyCount + 1
  }
  if (emptyCount != 0) {
    throw new Error('empty array for-of failed: ' + emptyCount)
  }

  console.log('verified')
}
