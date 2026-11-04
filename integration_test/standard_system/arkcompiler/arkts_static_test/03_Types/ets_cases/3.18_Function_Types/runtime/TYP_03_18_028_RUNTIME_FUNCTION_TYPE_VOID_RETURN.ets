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
 * @id TYP_03_18_028_RUNTIME_FUNCTION_TYPE_VOID_RETURN
 * @expect runtime
 * @section 3.18
 * @design void 返回函数类型的运行时行为验证
 * @note 运行时用例：验证 () => void 函数类型调用
 */
type Callback = () => void

function main(): void {
  let count: int = 0
  let cb: Callback = (): void => { count = count + 1 }

  cb()
  if (count != 1) {
    throw new Error("After 1st cb(), count should be 1")
  }

  cb()
  if (count != 2) {
    throw new Error("After 2nd cb(), count should be 2")
  }

  let actions: Callback[] = [(): void => { count = count + 10 }, (): void => { count = count * 2 }]
  for (let action of actions) {
    action()
  }
  if (count != 24) {
    throw new Error("After all actions, count should be 24, got: " + count)
  }

  console.log("Void return function type verified")
}