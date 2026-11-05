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
 * @id STMT_08_15_1_013_RUNTIME_multiple_instanceof_subclasses
 * @expect runtime
 * @section 8.15.1
 * @design catch块内对多个Error子类做instanceof类型判断的运行时验证
 * @note 运行时用例：验证catch(e)配合instanceof识别RangeError/TypeError/Error
 */
function main(): void {
  let gotRange: boolean = false
  try { throw new RangeError() }
  catch (e) {
    if (e instanceof RangeError) { gotRange = true }
  }
  if (!gotRange) { throw new Error("RangeError should be caught by instanceof") }

  let gotType: boolean = false
  try { throw new TypeError() }
  catch (e) {
    if (e instanceof TypeError) { gotType = true }
  }
  if (!gotType) { throw new Error("TypeError should be caught by instanceof") }

  let gotError: boolean = false
  try { throw new Error("test") }
  catch (e) {
    if (e instanceof Error) { gotError = true }
  }
  if (!gotError) { throw new Error("Error should be caught by instanceof") }

  console.log("verified")
}
