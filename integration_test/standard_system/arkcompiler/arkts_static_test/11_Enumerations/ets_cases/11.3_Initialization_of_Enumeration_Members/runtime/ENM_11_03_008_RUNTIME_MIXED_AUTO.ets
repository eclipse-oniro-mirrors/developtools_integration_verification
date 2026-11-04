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
 * @id ENM_11_03_008_RUNTIME_MIXED_AUTO
 * @expect runtime
 * @section 11.3
 * @design 部分 auto 递增运行时值正确
 * @note 运行时用例：Red=0, Blue=5, Green=6
 */
enum Color8 { Red, Blue = 5, Green }

function main(): void {
  if (Color8.Red != 0) throw new Error("Red should be 0")
  if (Color8.Blue != 5) throw new Error("Blue should be 5")
  if (Color8.Green != 6) throw new Error("Green should be 6")
  console.log("Enum member initialization runtime verified")
}