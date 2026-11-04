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
 * @id CLS_09_07_004_PASS_STATIC_METHOD_ACCESS_PROTECTED_PRIVATE
 * @expect compile-pass
 * @section 9.7.1
 * @design 静态方法可通过参数或局部变量访问同类型对象的protected/private成员
 * @note 正向用例：静态方法内通过参数引用访问同类及派生类的受保护/私有字段
 */
class C004 {
  protected countProtected: int = 10
  private countPrivate: int = 20

  static getProtected(c: C004): int {
    return c.countProtected
  }

  static getPrivate(c: C004): int {
    return c.countPrivate
  }

  static modifyProtected(c: C004, v: int): void {
    c.countProtected = v
  }

  static modifyPrivate(c: C004, v: int): void {
    c.countPrivate = v
  }

  static createAndAccess(): int {
    let local: C004 = new C004()
    return local.countProtected + local.countPrivate
  }
}

class D004 extends C004 {
  private derivedField: int = 30

  static getDerivedField(d: D004): int {
    return d.derivedField
  }

  static getBaseProtected(d: D004): int {
    return d.countProtected
  }
}

function testStaticAccessProtectedPrivate(): void {
  let c: C004 = new C004()
  let p: int = C004.getProtected(c)
  let q: int = C004.getPrivate(c)
  C004.modifyProtected(c, 99)
  C004.modifyPrivate(c, 88)

  let d: D004 = new D004()
  let r: int = D004.getDerivedField(d)
  let s: int = D004.getBaseProtected(d)

  let sum: int = C004.createAndAccess()
}
