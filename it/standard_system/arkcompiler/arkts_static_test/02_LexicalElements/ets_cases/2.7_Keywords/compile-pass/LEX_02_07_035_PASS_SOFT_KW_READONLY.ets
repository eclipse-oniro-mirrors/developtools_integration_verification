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
 * @id LEX_02_07_035_PASS_SOFT_KW_READONLY
 * @expect compile-pass
 * @section 2.7
 * @design 软关键字: readonly 修饰字段
 * @note 正向用例：readonly 字段
 */
class Point035 {
  readonly x: int
  readonly y: int

  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
}

function test035(): void {
  let p: Point035 = new Point035(1, 2)
  let v: int = p.x + p.y
}
