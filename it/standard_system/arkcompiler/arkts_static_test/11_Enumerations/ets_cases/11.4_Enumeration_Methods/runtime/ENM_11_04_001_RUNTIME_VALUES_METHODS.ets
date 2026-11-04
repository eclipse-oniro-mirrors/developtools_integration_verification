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
 * @id ENM_11_04_001_RUNTIME_VALUES_METHODS
 * @expect runtime
 * @section 11.4
 * @design 枚举静态方法: values/getValueOf/fromValue
 * @note 运行时用例
 */
enum Color { Red, Green, Blue = 5 }

function main(): void {
  let colors: FixedArray<Color> = Color.values()
  if (colors.length != 3) throw new Error("values length failed")
  if (colors[0] != Color.Red) throw new Error("first should be Red")

  let red: Color = Color.getValueOf("Red")
  if (red != Color.Red) throw new Error("getValueOf Red failed")

  let b: Color = Color.fromValue(5)
  if (b != Color.Blue) throw new Error("fromValue 5 should be Blue")

  console.log("enum static methods verified")
}