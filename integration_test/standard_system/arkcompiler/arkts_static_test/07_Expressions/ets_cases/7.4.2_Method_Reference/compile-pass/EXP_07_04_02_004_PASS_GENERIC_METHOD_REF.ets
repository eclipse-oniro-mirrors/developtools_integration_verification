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
 * @id EXP_07_04_02_004_PASS_GENERIC_METHOD_REF
 * @expect compile-pass
 * @section 7.4.2
 * @design 泛型方法引用：验证带显式类型参数的泛型方法引用编译通过
 * @note 正向用例：验证 C().gen<string> 带显式类型参数的泛型方法引用编译通过
 */
class C {
  gen<T>(x: T): T {
    return x
  }
}

let a = new C().gen<string>  // OK，带显式类型参数的泛型方法引用
