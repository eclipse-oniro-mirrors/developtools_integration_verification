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
 * @id EXP2_17_06_009_PASS_ABSTRACT_ITERATOR_INTERFACE
 * @expect compile-pass
 * @section 17.6
 * @design 接口中定义抽象 $_iterator() 方法，由实现类提供具体实现，编译器应通过
 * @note 正向用例：验证接口中抽象 $_iterator 编译通过
 */
interface HasIterator<T> {
  $_iterator(): Iterator<T>
}

class IntSource implements HasIterator<int> {
  private val: int
  constructor(v: int) {
    this.val = v
  }
  $_iterator(): Iterator<int> {
    return new IntSourceIter(this.val)
  }
}

class IntSourceIter implements Iterator<int> {
  private v: int
  private sent: boolean = false
  constructor(v: int) {
    this.v = v
  }
  next(): IteratorResult<int> {
    if (this.sent) {
      return new IteratorResult<int>()
    }
    this.sent = true
    return new IteratorResult<int>(this.v)
  }
}
