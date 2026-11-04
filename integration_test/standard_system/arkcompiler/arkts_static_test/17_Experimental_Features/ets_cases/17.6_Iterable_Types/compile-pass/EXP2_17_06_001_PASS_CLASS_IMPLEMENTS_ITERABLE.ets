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
 * @id EXP2_17_06_001_PASS_CLASS_IMPLEMENTS_ITERABLE
 * @expect compile-pass
 * @section 17.6
 * @design 类实现 Iterable<number> 接口，定义 $_iterator() 方法返回 Iterator<number> 子类型，编译器应通过
 * @note 正向用例：验证基本 Iterable 实现编译通过的正确用法
 */
class NumberRange implements Iterable<number> {
  private start: int
  private end: int
  constructor(s: int, e: int) {
    this.start = s
    this.end = e
  }
  $_iterator(): Iterator<number> {
    return new NumberRangeIterator(this.start, this.end)
  }
}

class NumberRangeIterator implements Iterator<number> {
  private current: int
  private end: int
  constructor(s: int, e: int) {
    this.current = s
    this.end = e
  }
  next(): IteratorResult<number> {
    if (this.current > this.end) {
      return new IteratorResult<number>()
    }
    return new IteratorResult<number>(this.current++)
  }
}
