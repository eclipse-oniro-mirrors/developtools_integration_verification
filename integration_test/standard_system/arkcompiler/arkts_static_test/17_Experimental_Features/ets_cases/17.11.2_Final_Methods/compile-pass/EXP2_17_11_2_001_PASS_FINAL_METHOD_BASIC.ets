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
 * @id EXP2_17_11_2_001_PASS_FINAL_METHOD_BASIC
 * @expect compile-pass
 * @section 17.11.2
 * @design final 方法基本声明：验证 final 实例方法可以正常声明，包括无返回值和有返回值的方法
 * @note 正向用例：验证 final 方法声明编译通过的正确用法
 */
class Base {
  final sayHello(): void {
    console.log('Hello')
  }
}

class Derived extends Base {
  // 不重写 final 方法，合法继承
}

function testFinalMethodBasic(): void {
  let b: Base = new Base()
  b.sayHello()
  let d: Derived = new Derived()
  d.sayHello()
  console.log('pass')
}
