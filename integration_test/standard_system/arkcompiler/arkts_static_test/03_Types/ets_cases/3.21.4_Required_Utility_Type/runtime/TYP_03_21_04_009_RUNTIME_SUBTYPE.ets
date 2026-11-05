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
 * @id TYP_03_21_04_009_RUNTIME_SUBTYPE
 * @expect runtime
 * @section 3.21.4
 * @design Required 基本运行时值
 * @note 运行时用例
 */
interface Item9 { label?: string; count?: int }
type RequiredItem9 = Required<Item9>

function main(): void {
  let r: RequiredItem9 = {label: "A", count: 1}
  if (r.label != "A") throw new Error("label failed")
  console.log("Required runtime verified")
}