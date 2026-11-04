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
 * @id CLS_09_07_014_FAIL_RETURN_NON_THIS
 * @expect compile-fail
 * @section 9.7.8
 * @design 声明返回this的方法，只能直接return this或调用另一返回this的方法的结果，返回其他值为编译错误
 * @note 反向用例：返回this类型的方法中return new对象实例，违反返回规则
 */
class Factory014 {
  name: string = ""

  setName(n: string): this {
    this.name = n
    return this
  }

  // Error: method declared to return 'this' must not return a new instance
  clone(): this {
    return new Factory014()
  }

  // Error: method declared to return 'this' must not return a literal
  badReturn(): this {
    return 0
  }
}
