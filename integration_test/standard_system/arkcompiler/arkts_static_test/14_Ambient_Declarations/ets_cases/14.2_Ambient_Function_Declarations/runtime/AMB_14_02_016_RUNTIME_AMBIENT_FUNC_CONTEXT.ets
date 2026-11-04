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
 * @id AMB_14_02_016_RUNTIME_AMBIENT_FUNC_CONTEXT
 * @expect runtime
 * @section 14.2
 * @design ambient function 声明与带 main 的正常代码共存，
 *          验证 ambient 声明不干扰编译和执行
 * @note 运行时用例：验证 ambient function 声明不影响其他代码运行
 */
declare function externalFunc(x: int): void

function main(): void {
  let sum: int = 1 + 2
  if (sum != 3) {
    throw new Error('assertion failed: ' + sum)
  }
  console.log('verified')
}
