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
 * @id STMT_08_15_3_030_RUNTIME_TRY_ABRUPT_NO_CATCH
 * @expect runtime
 * @section 8.15.3
 * @design try-finally 无 catch 异常向外传播
 * @runtime-throws=Error
 * @note 运行时用例：实际执行验证无catch传播
 */
function main(): void {
  try { throw new Error("inner") } finally { console.log("finally runs") }
  console.log("never reached")
}
