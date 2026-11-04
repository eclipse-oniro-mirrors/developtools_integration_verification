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
 * @id TYP_03_04_009_PASS_TYPE_REFERENCE_WITH_ARGS
 * @expect compile-pass
 * @section 3.4
 * @design 类型引用通过类型名 + 类型参数实例化命名类型
 * @note 正向用例：named type 通过 typeArguments 引用
 */
class Holder<T> {
  v: T
  constructor(x: T) { this.v = x }
}

class Pair<A, B> {
  first: A
  second: B
  constructor(a: A, b: B) {
    this.first = a
    this.second = b
  }
}

function testTypeReferenceWithArgs(): void {
  // 单类型参数引用
  let h1: Holder<int> = new Holder<int>(1)
  let h2: Holder<string> = new Holder<string>("x")

  // 多类型参数引用
  let p: Pair<int, string> = new Pair<int, string>(1, "y")

  // 嵌套引用
  let nested: Holder<Holder<int>> = new Holder<Holder<int>>(new Holder<int>(2))
}