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
 * @id CLS_09_09_012_PASS_OBJECT_DEFAULT_CTOR
 * @expect compile-pass
 * @section 9.9.3
 * @design 无extends子句的类，隐式继承Object，自动获得public默认构造器
 * @note 正向用例：class无extends无显式构造器，验证默认构造器不调用super()亦可编译
 */
class MyObject {
  id: int = 0
  name: string = "default"
}
function test(): void {
  let obj: MyObject = new MyObject()
}
