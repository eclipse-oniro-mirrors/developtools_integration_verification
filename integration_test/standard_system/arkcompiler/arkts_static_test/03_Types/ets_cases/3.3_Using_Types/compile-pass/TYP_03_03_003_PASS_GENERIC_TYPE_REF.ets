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
 * @id TYP_03_03_003_PASS_GENERIC_TYPE_REF
 * @expect compile-pass
 * @section 3.3
 * @design 泛型类型引用 Map<string, number>、嵌套 A<B<C>>
 * @note 正向用例：验证带类型参数的类型引用
 */
class Holder<T> {
  value: T
  constructor(v: T) { this.value = v }
}

class Wrap<T, U> {
  first: T
  second: U
  constructor(a: T, b: U) {
    this.first = a
    this.second = b
  }
}

function testGenericTypeRef(): void {
  let h1: Holder<int> = new Holder<int>(1)
  let h2: Holder<string> = new Holder<string>("a")

  // 嵌套泛型引用
  let nested: Holder<Holder<int>> = new Holder<Holder<int>>(new Holder<int>(42))

  let w: Wrap<int, string> = new Wrap<int, string>(1, "hi")
}