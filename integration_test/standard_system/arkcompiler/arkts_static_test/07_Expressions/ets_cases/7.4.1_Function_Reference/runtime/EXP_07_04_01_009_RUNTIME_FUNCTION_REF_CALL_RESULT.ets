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
 * @id EXP_07_04_01_009_RUNTIME_FUNCTION_REF_CALL_RESULT
 * @expect runtime
 * @section 7.4.1
 * @design 函数引用调用结果验证：验证通过函数引用调用的返回值正确
 * @note 运行时用例：通过引用调用函数并断言返回值
 */
function add(a: int, b: int): int {
  return a + b
}

function main(): void {
  let func = add
  let result = func(3, 5)

  if (result != 8) {
    throw new Error('assertion failed: func(3,5) = ' + result)
  }
console.log('verified')
}
