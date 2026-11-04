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
 * @id ENM_11_04_007_RUNTIME_STRING_ENUM_METHODS
 * @expect runtime
 * @section 11.4
 * @design string 基类枚举 instance 方法
 * @note 运行时用例
 */
enum E7 { A = "x", B = "y" }

function main(): void {
  let v: E7 = E7.A
  let val: string = v.valueOf()
  if (val != "x") throw new Error("string valueOf should be x")
  if (v.getName() != "A") throw new Error("getName should be A")
  if (v.toString() != "x") throw new Error("toString should be x")
  console.log("string enum methods verified")
}