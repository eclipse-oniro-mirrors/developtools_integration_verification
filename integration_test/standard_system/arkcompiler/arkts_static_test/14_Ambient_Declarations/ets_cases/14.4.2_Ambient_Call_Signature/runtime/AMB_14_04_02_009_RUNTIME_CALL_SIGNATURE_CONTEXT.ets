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
 * @id AMB_14_04_02_009_RUNTIME_CALL_SIGNATURE_CONTEXT
 * @expect runtime
 * @section 14.4.2
 * @design ambient class 含 call signature 与 main 共存
 * @note 运行时用例：验证 call signature 不影响其他代码运行
 */
declare class Callable {
  (x: string): void
}

function main(): void {
  let n: int = 42
  if (n != 42) {
    throw new Error("assertion failed: " + n)
  }
  console.log('verified')
}
