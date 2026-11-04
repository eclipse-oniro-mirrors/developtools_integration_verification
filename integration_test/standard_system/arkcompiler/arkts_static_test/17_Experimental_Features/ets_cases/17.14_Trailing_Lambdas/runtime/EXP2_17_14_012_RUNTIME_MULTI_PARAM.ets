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
 * @id EXP2_17_14_012_RUNTIME_MULTI_PARAM
 * @expect runtime
 * @section 17.14
 * @design 验证有前置参数时 trailing lambda 的参数正确传递
 * @note 运行时用例：前置参数正确传递给函数，同时 trailing lambda 被执行
 */
let g_prefix_received: string = ''
let g_trailing_executed: boolean = false

function processWithParams(prefix: string, callback: () => void): void {
  g_prefix_received = prefix
  callback()
}

function main(): void {
  g_prefix_received = ''
  g_trailing_executed = false
  processWithParams('hello') { g_trailing_executed = true }
  if (g_prefix_received != 'hello') {
    throw new Error("assertion failed: prefix not received, got '" + g_prefix_received + ''')
  }
  if (!g_trailing_executed) {
    throw new Error('assertion failed: trailing lambda not executed')
  }
  console.log("verified: prefix='" + g_prefix_received + '', trailing executed')
}
