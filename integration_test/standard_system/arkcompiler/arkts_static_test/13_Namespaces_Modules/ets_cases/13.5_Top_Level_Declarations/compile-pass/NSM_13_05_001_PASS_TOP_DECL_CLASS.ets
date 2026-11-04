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
/*
 * @id NSM_13_05_001_PASS_TOP_DECL_CLASS
 * @expect compile-pass
 * @section 13.5
 * @design Top-level class declaration
 */

class Point {
  public x: int
  public y: int
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
}

function main(): void {
    let p: Point = new Point(1, 2)
}
