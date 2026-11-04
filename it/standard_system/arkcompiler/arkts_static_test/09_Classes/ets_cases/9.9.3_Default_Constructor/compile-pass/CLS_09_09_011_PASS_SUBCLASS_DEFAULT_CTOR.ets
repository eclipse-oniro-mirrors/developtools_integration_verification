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
 * @id CLS_09_09_011_PASS_SUBCLASS_DEFAULT_CTOR
 * @expect compile-pass
 * @section 9.9.3
 * @design 父类有无参public构造器时，无显式构造器的子类自动获得默认构造器
 * @note 正向用例：父类有可访问的无参构造器，子类默认构造器可正常调用super()
 */
class Parent {
  constructor() {}
  x: int = 1
}
class Child extends Parent {
  y: string = "child"
}
function test(): void {
  let obj: Child = new Child()
}
