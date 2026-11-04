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
 * @id STMT_08_14_029_RUNTIME_THROW_UNCAUGHT
 * @expect runtime
 * @section 8.14
 * @design throw 未被 catch 导致 UncaughtExceptionError
 * @runtime-throws=Error
 * @note 运行时用例：实际执行验证未捕获throw
 */
function main(): void {
  throw new Error("uncaught")
  console.log("never")
}
