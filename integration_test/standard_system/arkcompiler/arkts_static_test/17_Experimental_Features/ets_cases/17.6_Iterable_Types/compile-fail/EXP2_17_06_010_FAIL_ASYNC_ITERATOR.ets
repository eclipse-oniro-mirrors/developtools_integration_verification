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
 * @id EXP2_17_06_010_FAIL_ASYNC_ITERATOR
 * @expect compile-fail
 * @section 17.6
 * @design $_iterator() 方法标记为 async 应产生编译时错误（spec 规定 $_iterator 不能是 async）
 * @note 反向用例：验证 async $_iterator 应产生编译时错误
 */
class BadAsyncIterable implements Iterable<string> {
  private data: string[]
  constructor(d: string[]) {
    this.data = d
  }
  async $_iterator(): Iterator<string> {
    return new BadIter(this.data)
  }
}

class BadIter implements Iterator<string> {
  private arr: string[]
  private idx: int = 0
  constructor(a: string[]) {
    this.arr = a
  }
  next(): IteratorResult<string> {
    if (this.idx >= this.arr.length) {
      return new IteratorResult<string>()
    }
    return new IteratorResult<string>(this.arr[this.idx++])
  }
}
