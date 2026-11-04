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
 * @id EXP2_17_14_010_RUNTIME_EXECUTION
 * @expect runtime
 * @section 17.14
 * @design 通过全局标志验证 trailing lambda 实际被执行
 * @note 运行时用例：验证 trailing lambda 体被调用执行
 */
let g_executed: boolean = false

function runCallback(callback: () => void): void {
  callback()
}

function main(): void {
  g_executed = false
  runCallback() { g_executed = true }
  if (!g_executed) {
    throw new Error('assertion failed: trailing lambda was not executed')
  }
  console.log('verified: trailing lambda executed')
}
