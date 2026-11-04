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
 * @id AMB_14_03_012_RUNTIME_AMBIENT_OVERLOAD_CONTEXT
 * @expect runtime
 * @section 14.3
 * @design ambient overload 声明与带 main 的正常代码共存，
 *          验证不影响编译和执行
 * @note 运行时用例：验证 ambient overload 声明不影响其他代码运行
 */
declare function f1(p: string): void
declare function f2(p: number): void
declare overload f {f1, f2}

function main(): void {
  let x: int = 10
  let y: int = 20
  let sum: int = x + y
  if (sum != 30) {
    throw new Error("assertion failed: " + sum)
  }
  console.log('verified')
}
