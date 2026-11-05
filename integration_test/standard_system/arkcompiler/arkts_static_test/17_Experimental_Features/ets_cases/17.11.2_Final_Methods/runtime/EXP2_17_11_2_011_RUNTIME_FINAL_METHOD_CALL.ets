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
 * @id EXP2_17_11_2_011_RUNTIME_FINAL_METHOD_CALL
 * @expect runtime
 * @section 17.11.2
 * @design 调用 final 方法验证行为：验证声明为 final 的方法可以在运行时正确调用并返回期望值
 * @note 运行时用例：实际执行验证 final 方法的行为
 */
class Counter {
  public v: int
  constructor() {
    this.v = 0
  }
  final increment(): void {
    this.v = this.v + 1
  }
  final getValue(): int {
    return this.v
  }
}

function main(): void {
  let c: Counter = new Counter()
  if (c.getValue() != 0) {
    throw new Error('assertion failed: initial value should be 0')
  }
  c.increment()
  if (c.getValue() != 1) {
    throw new Error('assertion failed: after increment should be 1')
  }
  c.increment()
  c.increment()
  if (c.getValue() != 3) {
    throw new Error('assertion failed: after 3 increments should be 3')
  }
  console.log('verified')
}
