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
 * @id ERR_12_01_012_RUNTIME_HANDLE_ALL_ACTIONS
 * @expect runtime
 * @section 12.1
 * @design handleAll 捕获 actions 抛出的 Error 并执行 handlingActions
 * @note 运行时用例：验证 catch 中处理动作执行
 */
let handled: boolean = false
function actionThrows(): void {
  throw new Error()
}
function handlingAction(): void {
  handled = true
}
function handleAll(actions: () => void, handlingActions: () => void): void {
  try {
    actions()
  } catch (x) {
    handlingActions()
  }
}
function main(): void {
  handleAll(actionThrows, handlingAction)
  if (!handled) throw new Error("handling action should execute")
  console.log("handleAll verified")
}
