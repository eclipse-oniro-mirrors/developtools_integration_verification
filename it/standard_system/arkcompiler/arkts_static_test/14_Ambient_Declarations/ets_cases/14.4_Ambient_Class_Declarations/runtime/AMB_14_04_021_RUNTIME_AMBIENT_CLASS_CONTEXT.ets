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
 * @id AMB_14_04_021_RUNTIME_AMBIENT_CLASS_CONTEXT
 * @expect runtime
 * @section 14.4
 * @design ambient class 声明与带 main 的正常代码共存，
 *          验证不影响编译和执行
 * @note 运行时用例：验证 ambient class 声明不影响其他代码运行
 */
declare class ExternalClass {
  public id: int
  getName(): string
}

function main(): void {
  let x: int = 100
  if (x != 100) {
    throw new Error('assertion failed: ' + x)
  }
  console.log('verified')
}
