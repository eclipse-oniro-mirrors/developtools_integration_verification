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
 * @id TYP_03_05_011_FAIL_GENERIC_WRONG_ARITY
 * @expect compile-fail
 * @section 3.5
 * @design 泛型类型引用类型参数数量不匹配应失败
 * @note 反向用例：参数过少/过多
 */
class Box11<T> {
  v: T
  constructor(x: T) { this.v = x }
}

class Pair11<A, B> {
  first: A
  second: B
  constructor(a: A, b: B) {
    this.first = a
    this.second = b
  }
}

function testGenericWrongArityFail(): void {
  // 缺少类型参数（无 default）
  let b: Box11 = new Box11(1)
  // 类型参数过多
  let p1: Pair11<int> = new Pair11<int>(1, 2)
  // 类型参数过多 2
  let p2: Pair11<int, string, boolean> = new Pair11<int, string, boolean>(1, "x", true)
}