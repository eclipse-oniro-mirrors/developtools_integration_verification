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
 * @id EXP_07_04_01_010_RUNTIME_GENERIC_REF_CALL
 * @expect runtime
 * @section 7.4.1
 * @design 泛型函数引用调用结果验证：验证通过泛型函数引用调用的返回值正确
 * @note 运行时用例：通过带显式类型参数的泛型函数引用调用并断言
 */
function identity<T>(x: T): T {
  return x
}

function main(): void {
  let id = identity<int>
  let result = id(42)

  if (result != 42) {
    throw new Error('assertion failed: identity<int>(42) = ' + result)
  }
console.log('verified')
}
