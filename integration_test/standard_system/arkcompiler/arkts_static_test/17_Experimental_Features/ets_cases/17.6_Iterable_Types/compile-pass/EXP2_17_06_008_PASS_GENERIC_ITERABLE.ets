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
 * @id EXP2_17_06_008_PASS_GENERIC_ITERABLE
 * @expect compile-pass
 * @section 17.6
 * @design 泛型类实现泛型 Iterable<T>，编译器应通过
 * @note 正向用例：验证泛型 Iterable 编译通过
 */
class Wrapper<E> implements Iterable<E> {
  private value: E
  constructor(v: E) {
    this.value = v
  }
  $_iterator(): Iterator<E> {
    return new WrapperIter<E>(this.value)
  }
}

class WrapperIter<E> implements Iterator<E> {
  private val: E
  private emitted: boolean = false
  constructor(v: E) {
    this.val = v
  }
  next(): IteratorResult<E> {
    if (this.emitted) {
      return new IteratorResult<E>()
    }
    this.emitted = true
    return new IteratorResult<E>(this.val)
  }
}
