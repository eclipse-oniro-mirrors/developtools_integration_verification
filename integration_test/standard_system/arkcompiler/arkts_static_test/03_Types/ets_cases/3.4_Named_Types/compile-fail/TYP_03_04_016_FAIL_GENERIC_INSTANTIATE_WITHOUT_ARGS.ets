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
 * @id TYP_03_04_016_FAIL_GENERIC_INSTANTIATE_WITHOUT_ARGS
 * @expect compile-fail
 * @section 3.4
 * @design 泛型命名类型必须用类型参数实例化（除非有 default）
 * @note 反向用例：缺少类型参数引用泛型命名类型
 */
class GenericC<T> {
  v: T
  constructor(x: T) { this.v = x }
}

interface GenericI<T> {
  get(): T
}

function testGenericNoArgsFail(): void {
  // 引用泛型类时必须给类型参数
  let c: GenericC = new GenericC(1)
  let i: GenericI = null
}