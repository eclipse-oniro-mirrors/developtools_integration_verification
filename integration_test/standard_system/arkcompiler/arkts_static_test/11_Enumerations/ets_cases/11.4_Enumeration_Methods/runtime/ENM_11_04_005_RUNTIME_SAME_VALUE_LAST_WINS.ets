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
 * @id ENM_11_04_005_RUNTIME_SAME_VALUE_LAST_WINS
 * @expect runtime
 * @section 11.4
 * @design 同值枚举在 textually last 优先
 * @note 运行时用例：E { One=1, one=1, oNe=1 }, fromValue(1).getName() → "oNe"
 */
enum E5 { One = 1, one = 1, oNe = 1 }

function main(): void {
  let name: string = E5.fromValue(1).getName()
  if (name != "oNe") throw new Error("last member with same value should win, got " + name)
  console.log("same value last wins verified")
}