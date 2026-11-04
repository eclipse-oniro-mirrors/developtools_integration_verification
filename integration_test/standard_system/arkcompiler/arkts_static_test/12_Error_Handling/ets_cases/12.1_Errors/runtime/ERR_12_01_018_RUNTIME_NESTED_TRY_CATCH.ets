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
 * @id ERR_12_01_018_RUNTIME_NESTED_TRY_CATCH
 * @expect runtime
 * @section 12.1
 * @design 嵌套 try-catch 各自处理错误互不干扰
 * @note 运行时用例
 */
function main(): void {
  let outerCaught: boolean = false
  let innerCaught: boolean = false
  try {
    try {
      throw new Error("inner")
    } catch (e) {
      innerCaught = true
    }
    throw new Error("outer")
  } catch (e) {
    outerCaught = true
  }
  if (!innerCaught) {
    throw new Error("inner catch not executed")
  }
  if (!outerCaught) {
    throw new Error("outer catch not executed")
  }
  console.log("nested try-catch verified")
}
