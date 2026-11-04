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
 * @id TYP_03_02_028_RUNTIME_LITERAL_TYPE_CHECK
 * @expect runtime
 * @section 3.2
 * @design 字面量类型运行时是 string，可参与字符串运算
 * @note 运行时用例：验证字面量类型在运行时的值和比较
 */
type Direction = "up" | "down" | "left" | "right"

function move(dir: Direction): string {
  return "moving " + dir
}

function main(): void {
  let d: Direction = "up"
  let r: string = move(d)
  if (r != "moving up") {
    throw new Error("move(up) failed: " + r)
  }

  d = "down"
  if (move(d) != "moving down") {
    throw new Error("move(down) failed")
  }

  // 字面量类型支持比较
  if (d != "down") {
    throw new Error("literal compare failed")
  }

  let count: int = 0
  let dirs: Direction[] = ["up", "down", "left", "right"]
  for (let dd of dirs) {
    count++
  }
  if (count != 4) {
    throw new Error("dirs iteration failed")
  }

  console.log("Literal type runtime verified")
}