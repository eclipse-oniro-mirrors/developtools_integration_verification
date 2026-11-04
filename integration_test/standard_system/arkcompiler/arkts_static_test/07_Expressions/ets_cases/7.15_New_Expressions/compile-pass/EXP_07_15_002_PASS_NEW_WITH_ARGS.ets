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
 * @id EXP_07_15_002_PASS_NEW_WITH_ARGS
 * @expect compile-pass
 * @section 7.15
 * @design 验证带参数构造器 new A(42)
 * @note 正向用例：带参数类实例创建，验证参数传递
 */
class A {
  public x: int
  constructor(x: int) {
    this.x = x
  }
}
let a = new A(42)
