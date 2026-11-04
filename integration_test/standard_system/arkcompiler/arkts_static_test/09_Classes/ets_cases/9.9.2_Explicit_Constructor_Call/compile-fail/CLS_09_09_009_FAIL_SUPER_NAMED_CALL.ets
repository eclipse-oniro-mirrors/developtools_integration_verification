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
 * @id CLS_09_09_009_FAIL_SUPER_NAMED_CALL
 * @expect compile-fail
 * @section 9.9.2
 * @design 显式super.name()命名构造器调用 — 调用父类命名构造器
 * @note 反向用例（命名构造器为实验特性，当前es2panda不支持）：通过super.init(args)调用父类命名构造器
 */
class CLS_09_09_009_Base {
  value: int
  constructor init(x: int) {
    this.value = x
  }
  // Default unnamed constructor for implicit super() calls
  constructor() {
    this.value = -1
  }
}
class CLS_09_09_009_Derived extends CLS_09_09_009_Base {
  constructor fromBase(x: int) {
    super.init(x)
  }
}
