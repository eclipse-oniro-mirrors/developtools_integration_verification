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
 * @id CLS_09_09_006_FAIL_SUPER_ARG_THIS
 * @expect compile-fail
 * @section 9.9.1
 * @design super()调用实参不能使用this — spec: "Call argument uses this or super"
 * @note 反向用例：super()实参中引用this.instanceField应编译失败
 */
class Base006 {
  n: int = 0
  constructor(v: int) {
    this.n = v
  }
}
class Derived006 extends Base006 {
  x: int = 1
  constructor() {
    super(this.x)
  }
}
