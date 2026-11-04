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
 * @id CLS_09_09_010_PASS_CODE_BEFORE_SUPER
 * @expect compile-pass
 * @section 9.9.1
 * @design 主构造器中super()前可放置不使用this/super的任意代码 — spec: "Optional arbitrary code that uses neither this nor super"
 * @note 正向用例：验证super()前可执行局部变量计算、静态方法调用等不涉及this/super的代码
 */
class Base010 {
  n: int = 0
  constructor(v: int) {
    this.n = v
  }
}
class Derived010 extends Base010 {
  constructor(x: int) {
    let computed: int = x * 2 + 1
    let offset: int = 10
    super(computed + offset)
  }
}
