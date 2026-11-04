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
 * @id CLS_09_09_010_FAIL_THIS_NAMED_CALL
 * @expect compile-fail
 * @section 9.9.2
 * @design 显式this.name()命名构造器调用 — 同类命名构造器委托
 * @note 反向用例（命名构造器为实验特性，当前es2panda不支持）：一个命名构造器通过this.init(args)委托给另一个命名构造器
 */
class CLS_09_09_010_Data {
  x: int
  y: int
  // Named primary constructor
  constructor init(x: int, y: int) {
    this.x = x
    this.y = y
  }
  // Named secondary constructor delegates to primary
  constructor origin() {
    this.init(0, 0)
  }
}
