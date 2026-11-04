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
 * @id TYP_03_21_05_008_RUNTIME_RO_VALUE
 * @expect runtime
 * @section 3.21.5
 * @design Readonly 字段可读取
 * @note 运行时用例
 */
interface I8 {
  value: string
}
type R8 = Readonly<I8>

function main(): void {
  let ro: R8 = {value: "test"}
  if (ro.value != "test") throw new Error("readonly get failed")
  console.log("Readonly runtime verified")
}