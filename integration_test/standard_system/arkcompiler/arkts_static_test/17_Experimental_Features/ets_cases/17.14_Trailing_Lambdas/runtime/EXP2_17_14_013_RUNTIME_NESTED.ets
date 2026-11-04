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
 * @id EXP2_17_14_013_RUNTIME_NESTED
 * @expect runtime
 * @section 17.14
 * @design 验证嵌套 trailing lambda 按正确顺序执行
 * @note 运行时用例：外层先执行，内层在外层回调中执行
 */
let g_outer_executed: boolean = false
let g_inner_executed: boolean = false

function outerFunc(callback: () => void): void {
  g_outer_executed = true
  callback()
}

function innerFunc(callback: () => void): void {
  g_inner_executed = true
  callback()
}

function main(): void {
  g_outer_executed = false
  g_inner_executed = false
  outerFunc() {
    innerFunc() {
      console.log('nested executed')
    }
  }
  if (!g_outer_executed) {
    throw new Error('assertion failed: outer not executed')
  }
  if (!g_inner_executed) {
    throw new Error('assertion failed: inner not executed')
  }
  console.log('verified: nested trailing lambdas executed correctly')
}
