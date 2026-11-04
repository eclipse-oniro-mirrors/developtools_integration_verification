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
 * @id CLS_09_07_012_RUNTIME_RETURN_THIS
 * @expect runtime
 * @section 9.7.8
 * @design 返回this的实例方法运行时行为：方法链调用返回同一对象，override保持类型
 * @note 运行时用例：验证return this的方法链和对象一致性
 */
class Chain012 {
  private _value: int = 0
  private _label: string = ""

  setValue(v: int): this {
    this._value = v
    return this
  }

  setLabel(l: string): this {
    this._label = l
    return this
  }

  getValue(): int {
    return this._value
  }

  getLabel(): string {
    return this._label
  }
}

class SubChain012 extends Chain012 {
  private _extra: int = 0

  setExtra(e: int): this {
    this._extra = e
    return this
  }

  getExtra(): int {
    return this._extra
  }
}

function main(): void {
  // Test method chaining with return this
  let c: Chain012 = new Chain012()
  let result: Chain012 = c.setValue(10).setLabel("hello")

  // Verify result is the same object with correct values
  if (result.getValue() != 10) {
    throw new Error("Chained setValue failed")
  }
  if (result.getLabel() != "hello") {
    throw new Error("Chained setLabel failed")
  }

  // Test subclass method chaining
  let sc: SubChain012 = new SubChain012()
  sc.setValue(42).setLabel("world").setExtra(99)

  if (sc.getValue() != 42) {
    throw new Error("SubChain setValue failed")
  }
  if (sc.getLabel() != "world") {
    throw new Error("SubChain setLabel failed")
  }
  if (sc.getExtra() != 99) {
    throw new Error("SubChain setExtra failed")
  }

  // Verify return this preserves the correct type
  let chained: SubChain012 = sc.setValue(1).setLabel("x")
  if (chained.getValue() != 1) {
    throw new Error("Return this type preservation failed")
  }

  console.log("Return this runtime verified")
}
