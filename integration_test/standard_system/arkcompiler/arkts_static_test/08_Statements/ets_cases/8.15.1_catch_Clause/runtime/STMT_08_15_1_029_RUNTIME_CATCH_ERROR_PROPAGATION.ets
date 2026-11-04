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
 * @id STMT_08_15_1_029_RUNTIME_CATCH_ERROR_PROPAGATION
 * @expect runtime
 * @section 8.15.1
 * @design 内层 catch 未捕获的错误向外传播

 * @note 运行时用例：实际执行验证错误传播
 */
function main(): void {
  let outerCaught: boolean = false
  try { try { throw new Error() } catch (e) { throw e } } catch (e) { outerCaught = true }
  if (!outerCaught) { throw new Error("assertion: outer catch") }
  console.log("verified")
}
