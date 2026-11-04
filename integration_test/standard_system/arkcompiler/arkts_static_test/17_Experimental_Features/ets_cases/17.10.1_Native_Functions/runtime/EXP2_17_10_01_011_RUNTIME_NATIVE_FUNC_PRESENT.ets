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
 * @id EXP2_17_10_01_011_RUNTIME_NATIVE_FUNC_PRESENT
 * @expect runtime
 * @section 17.10.1
 * @design 原生函数声明存在性验证：声明 native function 后，不调用它，程序可正常编译并运行
 * @note 运行时用例：验证 native function 声明不影响程序正常执行
 */
native function platformGetVersion(): string
function main(): void {
  // Only declaring native function, not calling it
  // The program should compile and run without error
  let msg: string = 'native function declared successfully'
  if (msg != 'native function declared successfully') {
    throw new Error('assertion failed: expected success message')
  }
  console.log(msg)
}
