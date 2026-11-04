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
 * @id ENM_11_04_003_RUNTIME_INSTANCE_METHODS
 * @expect runtime
 * @section 11.4
 * @design 实例方法: toString/valueOf/getName
 * @note 运行时用例
 */
enum C3 { Red, Green = 10, Blue }

function main(): void {
  let c: C3 = C3.Green

  let name: string = c.getName()
  if (name != "Green") throw new Error("getName should be Green, got " + name)

  let val: int = c.valueOf()
  if (val != 10) throw new Error("valueOf should be 10, got " + val)

  if (c.toString() != val.toString()) throw new Error("toString should equal valueOf.toString")

  console.log("enum instance methods verified")
}