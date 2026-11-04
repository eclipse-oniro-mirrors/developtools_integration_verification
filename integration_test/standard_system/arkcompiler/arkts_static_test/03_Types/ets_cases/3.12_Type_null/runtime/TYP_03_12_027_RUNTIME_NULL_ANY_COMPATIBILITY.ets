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
 * @id TYP_03_12_027_RUNTIME_NULL_ANY_COMPATIBILITY
 * @expect runtime
 * @section 3.12
 * @design 运行时验证 null 可以赋给 Any 类型变量
 * @note 运行时用例：验证 Any 可持有 null
 */
function main(): void {
  let a: Any = null
  if (a != null) {
    throw new Error("Any variable assigned null should be null")
  }

  a = "hello"
  if (a == null) {
    throw new Error("Any variable assigned 'hello' should not be null")
  }
  console.log("TYP_03_12_027 verified")
}