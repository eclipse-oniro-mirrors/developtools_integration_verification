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
 * @id TYP_03_02_022_RUNTIME_ENUM_METHODS
 * @expect runtime
 * @section 3.2
 * @design 枚举类型内置方法运行时行为
 * @note 运行时用例：实际执行验证 enum 内置方法
 *       注：values() 返回 FixedArray<T> 而非 Array<T>（ArkTS 实现特性）
 */
enum EColor {
  Red,
  Green,
  Blue
}

function main(): void {
  let colors: FixedArray<EColor> = EColor.values()
  if (colors.length != 3) {
    throw new Error("values length should be 3, got " + colors.length)
  }

  if (colors[0] != EColor.Red) {
    throw new Error("colors[0] should be Red")
  }

  let g: EColor = EColor.fromValue(1)
  if (g != EColor.Green) {
    throw new Error("fromValue(1) should be Green")
  }

  let name: string = g.getName()
  if (name != "Green") {
    throw new Error("getName should be 'Green', got " + name)
  }

  let r: EColor = EColor.getValueOf("Red")
  if (r != EColor.Red) {
    throw new Error("getValueOf('Red') should be Red")
  }

  console.log("Enum methods verified")
}