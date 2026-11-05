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
 * @id TYP_03_02_029_RUNTIME_GENERIC_INSTANTIATE
 * @expect runtime
 * @section 3.2
 * @design 泛型类实例化运行时行为，多个类型参数实例化为不同的实例
 * @note 运行时用例：验证泛型类型参数运行时正确传递
 *       注：Container 避开 stdlib 已有的 Box
 */
class Container<T> {
  value: T
  constructor(v: T) {
    this.value = v
  }
  get(): T {
    return this.value
  }
  set(v: T): void {
    this.value = v
  }
}

class TwoTuple<A, B> {
  first: A
  second: B
  constructor(a: A, b: B) {
    this.first = a
    this.second = b
  }
}

function ident<T>(x: T): T {
  return x
}

function main(): void {
  let bi: Container<int> = new Container<int>(42)
  if (bi.get() != 42) {
    throw new Error("Container<int>.get failed")
  }
  bi.set(100)
  if (bi.get() != 100) {
    throw new Error("Container<int>.set failed")
  }

  let bs: Container<string> = new Container<string>("hello")
  if (bs.get() != "hello") {
    throw new Error("Container<string>.get failed")
  }

  let p: TwoTuple<int, string> = new TwoTuple<int, string>(1, "one")
  if (p.first != 1 || p.second != "one") {
    throw new Error("TwoTuple access failed")
  }

  let r1: int = ident<int>(5)
  if (r1 != 5) {
    throw new Error("ident<int> failed")
  }

  let r2: string = ident("world")
  if (r2 != "world") {
    throw new Error("ident inferred failed")
  }

  console.log("Generic instantiate verified")
}