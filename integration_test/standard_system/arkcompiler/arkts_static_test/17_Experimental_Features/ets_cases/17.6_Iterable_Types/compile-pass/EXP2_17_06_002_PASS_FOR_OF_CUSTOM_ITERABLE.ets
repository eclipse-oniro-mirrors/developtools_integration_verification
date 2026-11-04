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
 * @id EXP2_17_06_002_PASS_FOR_OF_CUSTOM_ITERABLE
 * @expect compile-pass
 * @section 17.6
 * @design 自定义 Iterable 类用于 for-of 语句，编译器应通过
 * @note 正向用例：验证 for-of 语句与自定义 Iterable 编译通过
 */
class StringList implements Iterable<string> {
  private items: string[]
  constructor(p: string[]) {
    this.items = p
  }
  $_iterator(): Iterator<string> {
    return new StringListIterator(this.items)
  }
}

class StringListIterator implements Iterator<string> {
  private data: string[]
  private idx: int = 0
  constructor(d: string[]) {
    this.data = d
  }
  next(): IteratorResult<string> {
    if (this.idx >= this.data.length) {
      return new IteratorResult<string>()
    }
    return new IteratorResult<string>(this.data[this.idx++])
  }
}
