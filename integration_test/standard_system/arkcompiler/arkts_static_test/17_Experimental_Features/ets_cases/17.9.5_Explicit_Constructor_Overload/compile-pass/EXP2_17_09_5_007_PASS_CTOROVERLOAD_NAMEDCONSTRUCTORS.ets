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
 * @id EXP2_17_09_5_007_PASS_CTOROVERLOAD_NAMEDCONSTRUCTORS
 * @expect compile-pass
 * @section 17.9.5
 * @design overload constructor 包含命名构造函数
 * @note 正向用例：命名构造函数参与 overload
 */
class Point2D {
  private x: int
  private y: int
  constructor origin() { this.x = 0; this.y = 0 }
  constructor fromCoords(a: int, b: int) { this.x = a; this.y = b }
  constructor fromSingle(v: int) { this.x = v; this.y = v }
  overload constructor { origin, fromCoords, fromSingle }
}
