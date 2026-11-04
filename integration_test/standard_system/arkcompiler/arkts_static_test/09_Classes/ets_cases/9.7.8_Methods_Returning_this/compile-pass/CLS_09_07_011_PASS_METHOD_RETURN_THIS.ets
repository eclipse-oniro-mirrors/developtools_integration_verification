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
 * @id CLS_09_07_011_PASS_METHOD_RETURN_THIS
 * @expect compile-pass
 * @section 9.7.8
 * @design 返回this的实例方法：return this、调用另一返回this的方法、override保持返回this
 * @note 正向用例：合法的返回this方法声明与方法链
 */
class Builder011 {
  private _name: string = ""
  private _count: int = 0

  setName(n: string): this {
    this._name = n
    return this
  }

  setCount(c: int): this {
    this._count = c
    return this
  }

  // Return result of another method that returns this
  configure(name: string, count: int): this {
    return this.setName(name).setCount(count)
  }

  getName(): string {
    return this._name
  }

  getCount(): int {
    return this._count
  }
}

class SubBuilder011 extends Builder011 {
  private _extra: string = ""

  setExtra(e: string): this {
    this._extra = e
    return this
  }

  // Override must also return this
  setName(n: string): this {
    super.setName(n)
    return this
  }

  getExtra(): string {
    return this._extra
  }
}

function testReturnThis(): void {
  let b: Builder011 = new Builder011()
  b.setName("test").setCount(5)
  b.configure("configured", 10)

  let sb: SubBuilder011 = new SubBuilder011()
  sb.setName("sub").setCount(3).setExtra("extra")
}
