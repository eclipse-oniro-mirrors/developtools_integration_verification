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
 * @id CLS_09_07_010_FAIL_STATIC_METHOD_CALLED_ON_INSTANCE
 * @expect compile-fail
 * @section 9.7.1
 * @design 静态方法只能通过类名限定调用，不能通过实例对象调用
 * @note 反向用例：通过实例对象调用静态方法导致编译错误
 */
class Class010 {
  private value: int = 42

  static getClassName(): string {
    return "Class010"
  }

  static compute(x: int, y: int): int {
    return x + y
  }

  instanceMethod(): void {
    let _: string = this.getClassName()
  }
}

function testStaticOnInstance(): void {
  let obj: Class010 = new Class010()
  let _: string = obj.getClassName()
  let __: int = obj.compute(1, 2)
}
