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
 * @id CLS_09_07_007_FAIL_STATIC_METHOD_TYPE_PARAMETER
 * @expect compile-fail
 * @section 9.7.1
 * @design 静态方法的方法签名或方法体中不能使用外围类的类型参数
 * @note 反向用例：静态方法使用外围类泛型参数T作为返回类型、参数类型或局部变量类型导致编译错误
 */
class BadGeneric007<T> {
  static process(val: T): T {
    return val
  }

  static getDefault(): T {
    let result: T
    return result
  }

  static printType(): void {
    let label: T
  }
}
