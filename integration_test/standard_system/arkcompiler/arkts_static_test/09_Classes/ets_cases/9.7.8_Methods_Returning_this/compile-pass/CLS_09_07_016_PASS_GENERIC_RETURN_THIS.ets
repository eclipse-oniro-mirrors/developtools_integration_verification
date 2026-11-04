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
 * @id CLS_09_07_016_PASS_GENERIC_RETURN_THIS
 * @expect compile-pass
 * @section 9.7.8
 * @design 泛型类中返回this的实例方法声明、方法链调用另一返回this的方法、子类正确重写并返回this
 * @note 正向用例：泛型类中合法的返回this方法声明与方法链，子类override保持返回this
 */
class Builder016<T> {
  private _data: T | undefined = undefined
  private _tag: string = ""

  setData(d: T): this {
    this._data = d
    return this
  }

  setTag(t: string): this {
    this._tag = t
    return this
  }

  // Return result of another method that returns this
  build(data: T, tag: string): this {
    return this.setData(data).setTag(tag)
  }

  getData(): T | undefined {
    return this._data
  }

  getTag(): string {
    return this._tag
  }
}

class SubBuilder016<T> extends Builder016<T> {
  private _extra: string = ""

  setExtra(e: string): this {
    this._extra = e
    return this
  }

  // Override must also return this
  override setTag(t: string): this {
    super.setTag(t)
    return this
  }

  // Override with method chain returning this
  override build(data: T, tag: string): this {
    return super.build(data, tag).setExtra("built")
  }

  getExtra(): string {
    return this._extra
  }
}

class NonGeneric016 extends Builder016<string> {
  // Override in non-generic subclass returning this
  override setData(d: string): this {
    super.setData(d)
    return this
  }
}

function testGenericReturnThis(): void {
  let b: Builder016<int> = new Builder016<int>()
  b.setData(10).setTag("ten")
  b.build(20, "twenty")

  let sb: SubBuilder016<int> = new SubBuilder016<int>()
  sb.setData(1).setTag("one").setExtra("extra")
  sb.build(2, "two")

  let ng: NonGeneric016 = new NonGeneric016()
  ng.setData("hello").setTag("world")
}
