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
/*
 * @id SEM_15_09_00_110_FAIL_CLASS_multiple_override_same_method
 * @expect compile-fail
 * @section 15.9
 * @design 规范 15.9.1：如果子类的多个方法重写超类中的同一方法，则发生编译时错误
 * @note 测试多个方法重写同一方法（应该编译失败）
 */

// 测试多个方法重写同一方法（编译失败）
class Base {
  method(p: number): void {
    console.log("Base.method(" + p + ')')
  }
}

class Derived extends Base {
  // 编译失败：多个方法重写同一方法
  override method(p: number): void {
    console.log("Derived.method1(" + p + ')')
  }
  
  // 编译失败：另一个方法也重写 Base.method(number)
  override method(p: number): void {
    console.log("Derived.method2(" + p + ')')
  }
}
