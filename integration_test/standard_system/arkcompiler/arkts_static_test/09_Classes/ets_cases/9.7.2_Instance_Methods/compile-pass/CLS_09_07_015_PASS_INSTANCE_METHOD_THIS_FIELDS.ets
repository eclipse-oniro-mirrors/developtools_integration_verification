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
 * @id CLS_09_07_015_PASS_INSTANCE_METHOD_THIS_FIELDS
 * @expect compile-pass
 * @section 9.7.2
 * @design 实例方法通过this访问实例字段，包括读取、赋值、复合赋值及表达式中的字段引用
 * @note 正向用例：实例方法内this引用当前对象的字段进行读写操作
 */
class Counter015 {
  private _value: int = 0
  private _label: string = ""

  constructor(label: string) {
    this._label = label
  }

  // 'this' reads field
  getValue(): int {
    return this._value
  }

  // 'this' writes field via assignment
  setValue(v: int): void {
    this._value = v
  }

  // 'this' with compound assignment (increment)
  increment(): void {
    this._value = this._value + 1
  }

  // 'this' reads and writes in a single method
  addAndReturn(delta: int): int {
    this._value = this._value + delta
    return this._value
  }

  // 'this' accessing multiple fields
  summary(): string {
    return this._label + ": " + this._value
  }

  // 'this' in conditional expression using field
  isPositive(): boolean {
    return this._value > 0
  }
}

function testInstanceMethodThisFields(): void {
  let c: Counter015 = new Counter015("count")
  c.setValue(10)
  let v1: int = c.getValue()
  c.increment()
  let v2: int = c.getValue()
  let v3: int = c.addAndReturn(5)
  let s: string = c.summary()
  let pos: boolean = c.isPositive()
}
