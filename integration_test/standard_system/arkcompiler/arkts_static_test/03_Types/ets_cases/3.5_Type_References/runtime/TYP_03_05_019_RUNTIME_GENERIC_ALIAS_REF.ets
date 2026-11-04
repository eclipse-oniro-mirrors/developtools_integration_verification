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
 * @id TYP_03_05_019_RUNTIME_GENERIC_ALIAS_REF
 * @expect runtime
 * @section 3.5
 * @design 泛型 type alias 引用 MyType<T> = A<T>[] 的运行时行为
 * @note 运行时用例：spec §3.5 例子 type MyType<T> = A<T>[]
 */
class A19r<T> {
  v: T | undefined
  constructor() { this.v = undefined }
  set(x: T): void { this.v = x }
  get(): T | undefined { return this.v }
}

type MyArr<T> = A19r<T>[]

function main(): void {
  let x: MyArr<int> = [new A19r<int>(), new A19r<int>()]

  // alias 与底层类型互换
  let y: A19r<int>[] = x
  if (y.length != 2) {
    throw new Error("alias array length failed")
  }

  // 元素操作
  x[0].set(100)
  let r: int | undefined = y[0].get()
  if (r != 100) {
    throw new Error("alias element modify not visible")
  }

  console.log("Generic alias ref runtime verified")
}