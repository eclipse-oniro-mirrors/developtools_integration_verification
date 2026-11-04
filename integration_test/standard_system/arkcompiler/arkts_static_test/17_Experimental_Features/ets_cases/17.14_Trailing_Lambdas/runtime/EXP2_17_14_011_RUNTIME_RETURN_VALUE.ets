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
 * @id EXP2_17_14_011_RUNTIME_RETURN_VALUE
 * @expect runtime
 * @section 17.14
 * @design 验证 trailing lambda 的返回值被正确接收
 * @note 运行时用例：compute 函数接收 trailing lambda 返回的 int 值
 */
let g_result: int = 0

function computeAndStore(callback: () => int): void {
  g_result = callback()
}

function main(): void {
  g_result = 0
  computeAndStore() { return 42 }
  if (g_result != 42) {
    throw new Error("assertion failed: expected 42, got " + g_result)
  }
  console.log("verified: trailing lambda returned " + g_result)
}
