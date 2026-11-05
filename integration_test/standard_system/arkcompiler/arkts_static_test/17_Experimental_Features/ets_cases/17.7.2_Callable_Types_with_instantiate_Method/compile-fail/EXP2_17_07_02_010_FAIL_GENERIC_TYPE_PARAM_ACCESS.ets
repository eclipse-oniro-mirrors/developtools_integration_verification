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
 * @id EXP2_17_07_02_010_FAIL_GENERIC_TYPE_PARAM_ACCESS
 * @expect compile-fail
 * @section 17.7.2
 * @design $_instantiate 是静态方法，不能访问泛型类的类型参数。在 $_instantiate 签名中引用类泛型类型参数应编译失败
 * @note 反向用例：验证 $_instantiate 签名中引用泛型类的类型参数时编译失败
 */
class MyFailFactory4<T> {
  public value: T | null = null

  constructor() {}

  static $_instantiate(factory: () => MyFailFactory4<T>, val: T): MyFailFactory4<T> {
    let result: MyFailFactory4<T> = factory()
    result.value = val
    return result
  }
}
