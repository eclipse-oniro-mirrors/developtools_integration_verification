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
 * @id EXP2_17_10_01_013_RUNTIME_NATIVE_AND_NORMAL_FUNC
 * @expect runtime
 * @section 17.10.1
 * @design 原生函数与普通函数共存：验证 native function 可以与普通函数在同一模块中声明，普通函数正常执行
 * @note 运行时用例：验证 native function 声明不影响普通函数的执行
 */
native function nativeGetData(): string
function normalGetData(): string {
  return 'data from normal function'
}
function main(): void {
  let result: string = normalGetData()
  if (result != 'data from normal function') {
    throw new Error('assertion failed: expected normal function to return data')
  }
  console.log(result)
}
