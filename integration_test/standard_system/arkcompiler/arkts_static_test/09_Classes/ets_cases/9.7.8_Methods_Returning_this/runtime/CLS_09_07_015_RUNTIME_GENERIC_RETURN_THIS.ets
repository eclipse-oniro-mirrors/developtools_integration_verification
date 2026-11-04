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
 * @id CLS_09_07_015_RUNTIME_GENERIC_RETURN_THIS
 * @expect runtime
 * @section 9.7.8
 * @design 泛型类中返回this的实例方法：this类型表示当前泛型类类型，方法链返回同一对象并保持泛型参数
 * @note 运行时用例：验证泛型类中return this的方法链、泛型参数保持、子类重写中this的正确类型
 */
class Chain015<T> {
  private _data: T | undefined = undefined
  private _label: string = ""

  setData(d: T): this {
    this._data = d
    return this
  }

  setLabel(l: string): this {
    this._label = l
    return this
  }

  getData(): T | undefined {
    return this._data
  }

  getLabel(): string {
    return this._label
  }
}

class SubChain015<T> extends Chain015<T> {
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
  // Test generic class method chaining with string data
  let c1: Chain015<string> = new Chain015<string>()
  let r1: Chain015<string> = c1.setLabel("generic").setData("hello")

  if (r1.getLabel() != "generic") {
    throw new Error("Generic chain setLabel failed")
  }
  if (r1.getData() != "hello") {
    throw new Error("Generic chain setData failed")
  }

  // Test generic class method chaining with int data
  let c2: Chain015<int> = new Chain015<int>()
  c2.setLabel("int-data").setData(42)

  if (c2.getLabel() != "int-data") {
    throw new Error("Int generic setLabel failed")
  }
  if (c2.getData() != 42) {
    throw new Error("Int generic setData failed")
  }

  // Test generic subclass with extended chaining
  let sc: SubChain015<string> = new SubChain015<string>()
  sc.setLabel("sub").setData("world").setExtra(99)

  if (sc.getLabel() != "sub") {
    throw new Error("SubChain setLabel failed")
  }
  if (sc.getData() != "world") {
    throw new Error("SubChain setData failed")
  }
  if (sc.getExtra() != 99) {
    throw new Error("SubChain setExtra failed")
  }

  // Verify return this preserves the correct generic type
  let chained: SubChain015<string> = sc.setLabel("retest").setData("again")
  if (chained.getLabel() != "retest") {
    throw new Error("SubChain retest setLabel failed")
  }
  if (chained.getData() != "again") {
    throw new Error("SubChain retest setData failed")
  }

  console.log("Generic return this runtime verified")
}
