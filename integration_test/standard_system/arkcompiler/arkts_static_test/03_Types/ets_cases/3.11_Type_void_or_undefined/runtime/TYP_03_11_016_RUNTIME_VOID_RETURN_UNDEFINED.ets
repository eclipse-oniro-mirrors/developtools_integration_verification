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
 * @id TYP_03_11_016_RUNTIME_VOID_RETURN_UNDEFINED
 * @expect runtime
 * @section 3.11
 * @design void 函数运行时返回 undefined
 * @note 运行时用例：void 返回 undefined
 */
function returnsVoid16(): void {
  return
}

function main(): void {
  let v: void = returnsVoid16()
  if (v !== undefined) {
    throw new Error("void return should be undefined")
  }
  console.log("void return undefined verified")
}