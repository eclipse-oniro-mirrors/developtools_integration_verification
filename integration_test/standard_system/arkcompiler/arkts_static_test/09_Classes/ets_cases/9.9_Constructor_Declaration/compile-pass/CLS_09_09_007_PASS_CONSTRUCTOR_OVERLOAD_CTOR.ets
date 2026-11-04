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
 * @id CLS_09_09_007_PASS_CONSTRUCTOR_OVERLOAD_CTOR
 * @expect compile-pass
 * @section 9.9
 * @design 构造器使用默认参数实现重载效果
 * @note 正向用例：通过默认参数实现多构造器效果
 */
class MultiCtor007 {
  private _x: int
  private _y: int
  constructor(x: int = 0, y: int = 0) {
    this._x = x
    this._y = y
  }
}
