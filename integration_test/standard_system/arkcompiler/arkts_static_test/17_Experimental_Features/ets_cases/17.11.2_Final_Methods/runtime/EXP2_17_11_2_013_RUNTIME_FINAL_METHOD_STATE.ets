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
 * @id EXP2_17_11_2_013_RUNTIME_FINAL_METHOD_STATE
 * @expect runtime
 * @section 17.11.2
 * @design final 方法修改和读取实例状态：验证 final 方法可以正确修改和读取对象字段
 * @note 运行时用例：验证 final 方法对实例状态的读写操作
 */
class Accumulator {
  public total: int
  public history: string

  constructor() {
    this.total = 0
    this.history = ''
  }

  final add(n: int): void {
    this.total = this.total + n
  }

  final record(op: string): void {
    this.history = this.history + op
  }

  final getTotal(): int {
    return this.total
  }

  final getHistory(): string {
    return this.history
  }
}

function main(): void {
  let acc: Accumulator = new Accumulator()
  if (acc.getTotal() != 0) {
    throw new Error('assertion failed: initial total should be 0')
  }
  if (acc.getHistory() != '') {
    throw new Error('assertion failed: initial history should be empty')
  }

  acc.add(10)
  acc.record("+10")
  if (acc.getTotal() != 10) {
    throw new Error('assertion failed: total should be 10')
  }

  acc.add(25)
  acc.record("+25")
  if (acc.getTotal() != 35) {
    throw new Error('assertion failed: total should be 35')
  }

  if (acc.getHistory() != "+10+25") {
    throw new Error('assertion failed: history should be '+10+25'')
  }

  console.log('verified')
}
