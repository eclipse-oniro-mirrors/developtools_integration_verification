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
 * @id EXP_07_04_01_006_FAIL_GENERIC_REF_NO_ARGS
 * @expect compile-fail
 * @section 7.4.1
 * @design 泛型函数引用无类型参数：验证无显式类型参数的泛型函数引用应产生编译时错误
 * @note 反向用例：gen 是泛型函数，不带类型参数的引用应报编译时错误
 */
function gen<T>(x: T): T {
  return x
}

let b = gen  // Compile-time error: no explicit type arguments for generic function reference
