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
 * @id CLS_09_09_014_FAIL_SUPER_NO_PARAMETERLESS
 * @expect compile-fail
 * @section 9.9.3
 * @design 父类仅有带参构造器时，无显式构造器的子类默认构造器无法调用super()导致编译失败
 * @note 反向用例：父类声明了带参构造器后不再有无参构造器，子类默认构造器找不到可调用super()
 */
class Base {
  value: int
  constructor(v: int) {
    this.value = v
  }
}
class Derived extends Base {
  extra: string = "derived"
}
