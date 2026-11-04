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
 * @id TYP_03_21_01_012_RUNTIME_AWAITED_COMPILE_OK
 * @expect runtime
 * @section 3.21.1
 * @design Awaited 是编译期 utility type，运行时无表现
 * @note 运行时用例：仅验证编译通过和类型正确
 */
type R12 = Awaited<Promise<int>>

function main(): void {
  let v: R12 = 42
  if (v != 42) {
    throw new Error("Awaited<int> should be int")
  }
  console.log("Awaited compile-time verified")
}