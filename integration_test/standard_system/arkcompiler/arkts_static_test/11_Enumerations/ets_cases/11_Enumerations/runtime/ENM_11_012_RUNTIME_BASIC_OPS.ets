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
 * @id ENM_11_012_RUNTIME_BASIC_OPS
 * @expect runtime
 * @section 11
 * @design 枚举基本成员值和相等比较运行时验证
 * @note 运行时用例
 */
enum Color { Red, Green, Blue = 5 }

function main(): void {
  let c: Color = Color.Red
  if (c != Color.Red) throw new Error("Red should equal Red")
  if (c == Color.Green) throw new Error("Red should not equal Green")
  if (Color.Blue == Color.Red) throw new Error("Blue should not equal Red")
  console.log("basic enum ops verified")
}
