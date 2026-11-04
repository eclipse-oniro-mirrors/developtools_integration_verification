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
 * @id CLS_09_07_019_PASS_INSTANCE_METHOD_PARAM_SHADOW
 * @expect compile-pass
 * @section 9.7.2
 * @design 实例方法参数名与实例字段名相同时的类型遮蔽：通过this.field访问字段，直接使用参数名访问参数
 * @note 正向用例：参数名遮蔽字段名时，this.field区分字段，裸名引用的是参数/局部变量
 */
class ShadowTest019 {
  private _value: int = 100
  private _flag: boolean = false

  // Parameter 'value' shadows the parameter itself; 'this._value' accesses the field
  setValue(_value: int): void {
    this._value = _value
  }

  // Parameter shadows field, both used in the same method
  updateValue(_value: int): int {
    let oldValue: int = this._value
    this._value = _value
    return oldValue
  }

  // Boolean parameter shadowing boolean field with similar name
  setFlag(_flag: boolean): void {
    this._flag = _flag
  }

  // Reading both the shadowed field and the parameter
  compareValue(_value: int): boolean {
    let fieldVal: int = this._value
    return fieldVal == _value
  }

  getValue(): int {
    return this._value
  }

  getFlag(): boolean {
    return this._flag
  }
}

class Calculator019 {
  private _acc: int = 0

  // Parameter name same as field name pattern across different methods
  addToAcc(amount: int): void {
    this._acc = this._acc + amount
  }

  subtractFromAcc(amount: int): void {
    this._acc = this._acc - amount
  }

  // Parameter used in conditional that also references field via this
  isGreaterThanAcc(value: int): boolean {
    return value > this._acc
  }

  getAcc(): int {
    return this._acc
  }
}

function testShadowingMethods(): void {
  let s: ShadowTest019 = new ShadowTest019()
  s.setValue(42)
  let v1: int = s.getValue()

  let old: int = s.updateValue(99)
  let v2: int = s.getValue()

  s.setFlag(true)
  let f: boolean = s.getFlag()

  let cmp: boolean = s.compareValue(99)

  let c: Calculator019 = new Calculator019()
  c.addToAcc(10)
  c.addToAcc(20)
  let acc: int = c.getAcc()

  let gt: boolean = c.isGreaterThanAcc(25)
  c.subtractFromAcc(5)
}
