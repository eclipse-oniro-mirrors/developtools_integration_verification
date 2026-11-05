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
 * @id CLS_09_01_010_RUNTIME_CLASS_INSTANCE
 * @expect runtime
 * @section 9.1
 * @design 创建类实例并验证字段访问
 * @note 运行时用例：验证类实例化与字段读写
 */
class SimplePoint {
  x: int
  y: int
  constructor(px: int, py: int) {
    this.x = px
    this.y = py
  }
}

function main(): void {
  let p = new SimplePoint(3, 4)
  if (p.x != 3) {
    throw new Error("p.x should be 3")
  }
  if (p.y != 4) {
    throw new Error("p.y should be 4")
  }
  p.x = 10
  if (p.x != 10) {
    throw new Error("p.x should be 10 after assignment")
  }
  console.log("Class instance verified")
}

