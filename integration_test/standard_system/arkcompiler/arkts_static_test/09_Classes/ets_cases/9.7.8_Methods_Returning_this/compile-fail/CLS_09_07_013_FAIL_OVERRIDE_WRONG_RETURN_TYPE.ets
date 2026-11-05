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
 * @id CLS_09_07_013_FAIL_OVERRIDE_WRONG_RETURN_TYPE
 * @expect compile-fail
 * @section 9.7.8
 * @design 重写返回this的方法时，子类返回类型必须为this（或父类型的超接口/超类），否则编译失败
 * @note 反向用例：子类重写返回this的方法，但声明返回void，违反override兼容性规则
 */
class Builder013 {
  value: int = 0

  setValue(v: int): this {
    this.value = v
    return this
  }
}

class BadBuilder013 extends Builder013 {
  // Error: override of setValue must also return this (or supertype of this class)
  override setValue(v: int): void {
    this.value = v
  }
}
