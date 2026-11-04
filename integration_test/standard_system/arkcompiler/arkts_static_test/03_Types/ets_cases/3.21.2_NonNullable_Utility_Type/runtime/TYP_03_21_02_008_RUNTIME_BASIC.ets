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
 * @id TYP_03_21_02_008_RUNTIME_BASIC
 * @expect runtime
 * @section 3.21.2
 * @design NonNullable 展开后运行时值正确
 * @note 运行时用例：Object
 */
type R8 = NonNullable<Object | null | undefined>

function main(): void {
  let v: R8 = new Object()
  if (!(v instanceof Object)) {
    throw new Error("NonNullable runtime failed")
  }
  console.log("NonNullable runtime verified")
}