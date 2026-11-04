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
 * @id TYP_03_21_01_011_RUNTIME_NESTED_AWAITED
 * @expect runtime
 * @section 3.21.1
 * @design 嵌套 Awaited 编译通过，运行时值正确
 * @note 运行时用例：嵌套 Promise 类型展开
 */
type R11 = Awaited<Promise<Promise<string>>>

function main(): void {
  let v: R11 = "hello"
  if (v != "hello") {
    throw new Error("nested Awaited failed")
  }
  console.log("Nested Awaited runtime verified")
}