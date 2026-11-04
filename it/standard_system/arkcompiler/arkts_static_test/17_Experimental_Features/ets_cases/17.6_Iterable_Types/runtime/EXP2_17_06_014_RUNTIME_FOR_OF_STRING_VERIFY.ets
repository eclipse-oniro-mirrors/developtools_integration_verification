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
 * @id EXP2_17_06_014_RUNTIME_FOR_OF_STRING_VERIFY
 * @expect runtime
 * @section 17.6
 * @design 运行时验证 for-of 遍历字符串类型（内置可迭代），验证每个字符
 * @note 运行时用例：实际执行验证字符串 for-of 迭代行为
 */
class StrCheckIterable implements Iterable<string> {
  private s: string
  constructor(s: string) {
    this.s = s
  }
  $_iterator(): Iterator<string> {
    return new StrCheckIter(this.s)
  }
}

class StrCheckIter implements Iterator<string> {
  private src: string
  private idx: int = 0
  constructor(s: string) {
    this.src = s
  }
  next(): IteratorResult<string> {
    if (this.idx >= this.src.length) {
      return new IteratorResult<string>()
    }
    return new IteratorResult<string>(this.src[this.idx++])
  }
}

function main(): void {
  let s: string = 'ArkTS'
  let result: string = ''
  let count: int = 0
  for (let ch of s) {
    result = result + ch
    count = count + 1
  }
  if (result != 'ArkTS') {
    throw new Error('string for-of concat failed: ' + result)
  }
  if (count != 5) {
    throw new Error('string for-of count failed: ' + count)
  }

  let emptyStr: string = ''
  let emptyCount: int = 0
  for (let ch of emptyStr) {
    emptyCount = emptyCount + 1
  }
  if (emptyCount != 0) {
    throw new Error('empty string for-of failed: ' + emptyCount)
  }

  console.log('verified')
}
