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
 * @id TYP_03_05_010_PASS_TYPE_PARAM_REF_INSIDE_GENERIC
 * @expect compile-pass
 * @section 3.5
 * @design 泛型类内部用类型参数 T 做类型引用
 * @note 正向用例：spec §3.5 例子 class C<T> { field1: A<T>, foo(p: T) }
 */
class A10<T> {
  v: T | undefined
  constructor() { this.v = undefined }
}

class C10<T> {
  field1: A10<T>           // A<T> 是类型引用 - 类类型引用
  field2: A10<number>      // A<number> 是类型引用 - 类类型引用

  constructor() {
    this.field1 = new A10<T>()
    this.field2 = new A10<number>()
  }

  foo(p: T): T {           // T 是类型引用 - 类型参数
    return p
  }
}

function testTypeParamRefInsideGeneric(): void {
  let c: C10<int> = new C10<int>()
  let r: int = c.foo(42)
}