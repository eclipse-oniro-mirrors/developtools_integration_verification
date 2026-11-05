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
 * @id CLS_09_07_008_RUNTIME_STATIC_METHOD_NOT_INHERITED
 * @expect runtime
 * @section 9.7.1
 * @design 静态方法不被继承：派生类无法通过类名访问未在本类声明的父类静态方法；静态方法绑定在声明类上，不随继承传递
 * @note 运行时用例：验证静态方法只能通过声明类名调用，派生类的同名静态方法独立存在
 */
class Base008 {
  private static baseValue: int = 100

  static getBaseValue(): int {
    return Base008.baseValue
  }

  static setBaseValue(v: int): void {
    Base008.baseValue = v
  }

  static baseOnly(): string {
    return "only_in_base"
  }
}

class Derived008 extends Base008 {
  private static derivedValue: int = 200

  static getDerivedValue(): int {
    return Derived008.derivedValue
  }

  static getBaseValueViaBase(): int {
    return Base008.getBaseValue()
  }

  static baseOnly(): string {
    return "overridden_in_derived"
  }
}

function main(): void {
  let b: int = Base008.getBaseValue()
  if (b != 100) {
    throw new Error("Base initial baseValue should be 100")
  }

  Base008.setBaseValue(999)
  let b2: int = Base008.getBaseValue()
  if (b2 != 999) {
    throw new Error("Base baseValue should be 999 after set")
  }

  let db: int = Derived008.getBaseValueViaBase()
  if (db != 999) {
    throw new Error("Derived should see baseValue=999 via explicit Base008 qualification")
  }

  let d: int = Derived008.getDerivedValue()
  if (d != 200) {
    throw new Error("Derived derivedValue should be 200")
  }

  let r1: string = Base008.baseOnly()
  if (r1 != "only_in_base") {
    throw new Error("Base008.baseOnly() should return 'only_in_base'")
  }

  let r2: string = Derived008.baseOnly()
  if (r2 != "overridden_in_derived") {
    throw new Error("Derived008.baseOnly() should return 'overridden_in_derived'")
  }

  Base008.setBaseValue(100)
  console.log("Static method not inherited runtime verified")
}
