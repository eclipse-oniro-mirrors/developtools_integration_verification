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
 * @id TYP_03_21_04_008_RUNTIME
 * @expect runtime
 * @section 3.21.4
 * @design Required 字段赋值正常运行时
 * @note 运行时用例
 */
interface R8 {
  name?: string
  value?: int
}
type RequiredR8 = Required<R8>

function main(): void {
  let r: RequiredR8 = {name: "test", value: 42}
  if (r.name != "test") throw new Error("name failed")
  if (r.value != 42) throw new Error("value failed")
  console.log("Required runtime verified")
}