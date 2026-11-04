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
 * @id EXP2_17_05_022_RUNTIME_GENERIC_INDEX
 * @expect runtime
 * @section 17.5
 * @design 运行时验证泛型类中的索引操作，使用 int 类型和 string 类型参数化
 * @note 运行时用例：验证泛型可索引类的读写正确性
 */
class PairStore<T> {
  private first: T | undefined
  private second: T | undefined

  $_get(index: int): T | undefined {
    if (index == 0) {
      return this.first
    }
    if (index == 1) {
      return this.second
    }
    return undefined
  }

  $_set(index: int, value: T): void {
    if (index == 0) {
      this.first = value
    } else if (index == 1) {
      this.second = value
    }
  }
}

function main(): void {
  // Test with number type
  let numStore: PairStore<number> = new PairStore<number>()
  numStore[0] = 100
  numStore[1] = 200
  let n0: number | undefined = numStore[0]
  let n1: number | undefined = numStore[1]
  if (n0 != 100) {
    throw new Error('assertion failed: numStore[0] expected 100, got ' + n0)
  }
  if (n1 != 200) {
    throw new Error('assertion failed: numStore[1] expected 200, got ' + n1)
  }

  // Test with string type
  let strStore: PairStore<string> = new PairStore<string>()
  strStore[0] = 'first'
  strStore[1] = 'second'
  let s0: string | undefined = strStore[0]
  let s1: string | undefined = strStore[1]
  if (s0 != 'first') {
    throw new Error('assertion failed: strStore[0] expected first, got ' + s0)
  }
  if (s1 != 'second') {
    throw new Error('assertion failed: strStore[1] expected second, got ' + s1)
  }

  // Test overwrite
  numStore[0] = 999
  if (numStore[0] != 999) {
    throw new Error('assertion failed: numStore[0] after overwrite expected 999')
  }

  console.log('verified')
}
