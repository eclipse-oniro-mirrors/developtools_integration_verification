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
 * @id CLS_09_06_0007_RUNTIME_FIELD_ACCESS
 * @expect runtime
 * @section 9.6
 * @design 字段访问运行时验�?
 * @note 运行时用例：验证字段读写操作正确
 */
class Point6 {
  x: int = 0
  y: int = 0
  constructor(px: int, py: int) {
    this.x = px
    this.y = py
  }
}
function main(): void {
  let p = new Point6(3, 7)
  if (p.x != 3) { throw new Error("p.x should be 3") }
  if (p.y != 7) { throw new Error("p.y should be 7") }
  p.x = 10
  if (p.x != 10) { throw new Error("p.x should be 10") }
  console.log("Field access verified")
}
