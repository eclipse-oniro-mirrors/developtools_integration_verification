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
 * @id TYP_03_01_048_RUNTIME_CHAR_COMPARE
 * @expect runtime
 * @section 3.1
 * @design char 类型的运行时比较
 * @note 运行时用例：验证 char 字面量和 ASCII 序比较
 *       设计发现：ArkTS char 不能隐式 widening 到 int（与 Java 不同）
 */
function main(): void {
  let a: char = c'a'
  let b: char = c'b'
  let A: char = c'A'

  // 'a' < 'b'
  if (!(a < b)) {
    throw new Error("'a' should be less than 'b'")
  }

  // 'A' < 'a' (ASCII 65 < 97)
  if (!(A < a)) {
    throw new Error("'A' should be less than 'a' (ASCII)")
  }

  // 相等
  let a2: char = c'a'
  if (a != a2) {
    throw new Error("Two 'a' chars should be equal")
  }

  // char 可与 char 计算差值（保持 char 类型语义）
  if (!(b > a)) {
    throw new Error("'b' should be greater than 'a'")
  }

  console.log("char compare verified")
}