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
 * @id TYP_03_21_02_009_RUNTIME_GENERIC_FIELD
 * @expect runtime
 * @section 3.21.2
 * @design 泛型 NonNullable<T> 字段运行时验证
 * @note 运行时用例：spec 原例 A<Object|undefined>
 */
class A9<T> {
  field: NonNullable<T>
  constructor(field: NonNullable<T>) {
    this.field = field
  }
}

function main(): void {
  const a = new A9<Object | undefined>(new Object())
  // field 类型是 Object
  let f: Object = a.field
  if (!(f instanceof Object)) {
    throw new Error("NonNullable field failed")
  }
  console.log("NonNullable generic field verified")
}