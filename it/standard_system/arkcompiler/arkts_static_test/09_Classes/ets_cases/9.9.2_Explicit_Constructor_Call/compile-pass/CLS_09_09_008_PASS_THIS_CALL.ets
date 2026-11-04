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
 * @id CLS_09_09_008_PASS_THIS_CALL
 * @expect compile-pass
 * @section 9.9.2
 * @design 显式this()构造器调用 — 同类主构造器/次级构造器模式
 * @note 正向用例：次级构造器通过this(args)委托给同类主构造器
 */
class CLS_09_09_008_Base {
  x: int
  y: int
  // Primary constructor: initializes all fields directly
  constructor(x: int, y: int) {
    this.x = x
    this.y = y
  }
  // Secondary constructor: delegates to primary via this()
  constructor() {
    this(0, 0)
  }
}
