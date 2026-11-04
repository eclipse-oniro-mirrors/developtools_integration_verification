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
 * @id STMT_08_14_028_RUNTIME_THROW_CUSTOM_ERROR
 * @expect runtime
 * @section 8.14
 * @design throw 自定义 Error 子类

 * @note 运行时用例：实际执行验证自定义Error
 */
class MyError extends Error {}
function main(): void {
  let caught: boolean = false
  try { throw new MyError() } catch (e) { caught = e instanceof MyError }
  if (!caught) { throw new Error("assertion: should be MyError") }
  console.log("verified")
}
