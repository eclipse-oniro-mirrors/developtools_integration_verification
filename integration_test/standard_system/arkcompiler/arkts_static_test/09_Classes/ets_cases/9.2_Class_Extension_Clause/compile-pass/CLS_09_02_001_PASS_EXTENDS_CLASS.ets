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
 * @id CLS_09_02_001_PASS_EXTENDS_CLASS
 * @expect compile-pass
 * @section 9.2
 * @design 类通过extends继承另一个类，编译通过
 * @note 正向用例：验证extends子句指向类类型的基本用法
 */
class BaseClass {
  public value: int = 0
  public getValue(): int {
    return this.value
  }
}
class SubClass extends BaseClass {
  public extra: string = ""
}
