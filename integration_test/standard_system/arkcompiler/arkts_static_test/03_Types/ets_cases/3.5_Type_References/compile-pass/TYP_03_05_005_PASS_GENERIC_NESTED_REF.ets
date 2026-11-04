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
 * @id TYP_03_05_005_PASS_GENERIC_NESTED_REF
 * @expect compile-pass
 * @section 3.5
 * @design 嵌套泛型类型引用 A<B<C>>
 * @note 正向用例：spec §3.5 例子中嵌套 generic instantiation
 */
class Cont5<T> {
  v: T
  constructor(x: T) { this.v = x }
}

function testGenericNestedRef(): void {
  // 嵌套泛型引用
  let nested: Cont5<Cont5<int>> = new Cont5<Cont5<int>>(new Cont5<int>(42))
  let triple: Cont5<Cont5<Cont5<string>>> =
    new Cont5<Cont5<Cont5<string>>>(new Cont5<Cont5<string>>(new Cont5<string>("a")))

  // 数组与泛型嵌套
  let arr: Cont5<int>[] = [new Cont5<int>(1), new Cont5<int>(2)]
}