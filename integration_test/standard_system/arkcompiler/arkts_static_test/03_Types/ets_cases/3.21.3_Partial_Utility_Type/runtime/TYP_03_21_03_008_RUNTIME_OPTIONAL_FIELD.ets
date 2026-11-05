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
 * @id TYP_03_21_03_008_RUNTIME_OPTIONAL_FIELD
 * @expect runtime
 * @section 3.21.3
 * @design Partial 字段可选，访问时需检查 undefined
 * @note 运行时用例：optional 字段行为
 */
interface I8 {
  name: string
  desc: string
}

function main(): void {
  let p: Partial<I8> = {name: "test"}
  if (p.name != "test") {
    throw new Error("assigned field should hold value")
  }
  if (p.desc !== undefined) {
    throw new Error("unassigned field should be undefined")
  }
  console.log("Partial optional field runtime verified")
}