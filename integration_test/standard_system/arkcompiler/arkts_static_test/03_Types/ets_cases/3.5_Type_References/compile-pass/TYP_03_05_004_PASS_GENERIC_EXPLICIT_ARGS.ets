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
 * @id TYP_03_05_004_PASS_GENERIC_EXPLICIT_ARGS
 * @expect compile-pass
 * @section 3.5
 * @design 泛型类型引用显式提供 type arguments
 * @note 正向用例：Map<string, number> 等显式类型参数引用
 */
class Holder4<T> {
  v: T
  constructor(x: T) { this.v = x }
}

class Pair4<A, B> {
  first: A
  second: B
  constructor(a: A, b: B) {
    this.first = a
    this.second = b
  }
}

function testGenericExplicitArgs(): void {
  // 单类型参数
  let h1: Holder4<int> = new Holder4<int>(42)
  let h2: Holder4<string> = new Holder4<string>("x")

  // 多类型参数
  let p: Pair4<int, string> = new Pair4<int, string>(1, "y")

  // stdlib 泛型
  let m: Map<string, number> = new Map<string, number>()
}