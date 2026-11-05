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
 * @id CLS_09_09_008_FAIL_CONSTRUCTOR_RECURSIVE
 * @expect compile-fail
 * @section 9.9.1
 * @design 构造器不能直接或间接调用自身 — spec: "constructor calls itself, directly or indirectly"
 * @note 反向用例：辅助构造器通过this()直接递归调用自身应编译失败
 */
class Recursive008 {
  x: int = 0
  constructor(v: int) {
    this.x = v
  }
  constructor(a: int, b: int) {
    this(a + b, 0)
  }
}
