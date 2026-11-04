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
 * @id ENM_11_02_008_RUNTIME_EXPLICIT_INT
 * @expect runtime
 * @section 11.2
 * @design 显式 int 基类枚举运行时数值正确
 * @note 运行时用例
 */
enum E8 { A = 10, B = 20 }

function main(): void {
  let v: int = E8.A
  if (v != 10) throw new Error("explicit int enum value failed")
  console.log("Explicit base type runtime verified")
}