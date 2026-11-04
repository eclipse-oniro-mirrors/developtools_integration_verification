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
 * @id TYP_03_04_007_PASS_GENERIC_NAMED_TYPES
 * @expect compile-pass
 * @section 3.4
 * @design 带类型参数的 class/interface/type alias 是 generic named types
 * @note 正向用例：泛型命名类型（generic types）的实例化
 */
// 泛型类
class GBox<T> {
  v: T
  constructor(x: T) { this.v = x }
}

// 泛型接口
interface GContainer<T> {
  put(v: T): void
  take(): T
}

// 泛型 type alias
type GPair<T> = [T, T]

// 实现泛型接口
class GListImpl<T> implements GContainer<T> {
  data: T[] = []
  put(v: T): void { this.data.push(v) }
  take(): T {
    let result: T | undefined = this.data.pop()
    return result as T
  }
}

function testGenericNamedTypes(): void {
  let b: GBox<int> = new GBox<int>(1)
  let c: GContainer<string> = new GListImpl<string>()
  c.put("x")
  let p: GPair<int> = [1, 2]
}