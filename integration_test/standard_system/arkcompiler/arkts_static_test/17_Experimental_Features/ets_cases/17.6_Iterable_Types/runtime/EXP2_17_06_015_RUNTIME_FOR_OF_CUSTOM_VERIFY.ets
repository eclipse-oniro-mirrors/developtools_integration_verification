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
 * @id EXP2_17_06_015_RUNTIME_FOR_OF_CUSTOM_VERIFY
 * @expect runtime
 * @section 17.6
 * @design 运行时验证自定义 Iterable 类的 for-of 迭代行为，验证迭代值和终止条件
 * @note 运行时用例：实际执行验证自定义 Iterable 的 for-of 行为
 */
class Range implements Iterable<int> {
  private from: int
  private to: int
  constructor(f: int, t: int) {
    this.from = f
    this.to = t
  }
  $_iterator(): Iterator<int> {
    return new RangeIter(this.from, this.to)
  }
}

class RangeIter implements Iterator<int> {
  private cur: int
  private end: int
  constructor(c: int, e: int) {
    this.cur = c
    this.end = e
  }
  next(): IteratorResult<int> {
    if (this.cur > this.end) {
      return new IteratorResult<int>()
    }
    return new IteratorResult<int>(this.cur++)
  }
}

function main(): void {
  let r: Range = new Range(1, 5)
  let sum: int = 0
  let count: int = 0
  for (let v of r) {
    sum = sum + v
    count = count + 1
  }
  if (sum != 15) {
    throw new Error('custom iterable sum failed: expected 15, got ' + sum)
  }
  if (count != 5) {
    throw new Error('custom iterable count failed: expected 5, got ' + count)
  }

  let emptyRange: Range = new Range(5, 1)
  let emptyCount: int = 0
  for (let v of emptyRange) {
    emptyCount = emptyCount + 1
  }
  if (emptyCount != 0) {
    throw new Error('empty custom iterable failed: ' + emptyCount)
  }

  console.log('verified')
}
