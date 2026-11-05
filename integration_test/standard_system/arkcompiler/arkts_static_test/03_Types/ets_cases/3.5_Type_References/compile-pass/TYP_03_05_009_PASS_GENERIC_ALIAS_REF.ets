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
 * @id TYP_03_05_009_PASS_GENERIC_ALIAS_REF
 * @expect compile-pass
 * @section 3.5
 * @design 泛型 type alias 引用 MyType<int>，替换为底层 A<int>[]
 * @note 正向用例：spec §3.5 例子 type MyType<T> = A<T>[]
 */
class A9<T> {
  v: T | undefined
  constructor() { this.v = undefined }
}

type MyType<T> = A9<T>[]

function testGenericAliasRef(): void {
  // MyType<number> 等价于 A9<number>[]
  let x: MyType<number> = [new A9<number>(), new A9<number>()]

  // 也可以直接写底层类型
  let y: A9<number>[] = x

  // 嵌套
  let z: MyType<string> = [new A9<string>()]
}