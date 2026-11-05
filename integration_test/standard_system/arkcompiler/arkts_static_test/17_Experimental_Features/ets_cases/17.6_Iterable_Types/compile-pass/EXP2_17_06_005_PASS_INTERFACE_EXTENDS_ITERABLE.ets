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
 * @id EXP2_17_06_005_PASS_INTERFACE_EXTENDS_ITERABLE
 * @expect compile-pass
 * @section 17.6
 * @design 接口可以扩展 Iterable<T>，在其中声明 $_iterator()，编译应通过
 * @note 正向用例：验证接口扩展 Iterable 编译通过
 */
interface MyIterableCollection<T> extends Iterable<T> {
  $_iterator(): Iterator<T>
  size(): int
}

class MyNumberList implements MyIterableCollection<number> {
  private data: number[]
  constructor(p: number[]) {
    this.data = p
  }
  $_iterator(): Iterator<number> {
    return new MyNumIter(this.data)
  }
  size(): int {
    return this.data.length
  }
}

class MyNumIter implements Iterator<number> {
  private arr: number[]
  private pos: int = 0
  constructor(a: number[]) {
    this.arr = a
  }
  next(): IteratorResult<number> {
    if (this.pos >= this.arr.length) {
      return new IteratorResult<number>()
    }
    return new IteratorResult<number>(this.arr[this.pos++])
  }
}
