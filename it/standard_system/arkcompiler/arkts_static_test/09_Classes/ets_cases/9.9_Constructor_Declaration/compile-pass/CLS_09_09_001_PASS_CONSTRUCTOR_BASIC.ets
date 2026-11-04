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
 * @id CLS_09_09_001_PASS_CONSTRUCTOR_BASIC
 * @expect compile-pass
 * @section 9.9
 * @design 构造器基本语法：constructor 修饰符+参数+体
 * @note 正向用例：合法的构造器声明
 */
class Point001 {
  private _x: int
  private _y: int
  constructor(x: int, y: int) {
    this._x = x
    this._y = y
  }
}
class Line001 {
  private _start: Point001
  private _end: Point001
  constructor(start: Point001, end: Point001) {
    this._start = start
    this._end = end
  }
  get length(): double {
    return 1.0
  }
}
