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
 * @id SEM_15_02_00_118_FAIL_CLASS_assign_superclass_to_subclass
 * @expect compile-fail
 * @section 15.2
 * @design 规范 15.2.1：子类型关系是单向的，超类型不能赋值给子类型
 * @note 测试将超类实例赋值给子类型变量（应该编译失败）
 */

// 测试将超类赋值给子类型（编译失败）
class Base {
  public name: string = 'base'
}

class Derived extends Base {
  public extra: number = 42
}

function testAssignSuperclassToSubclass(): void {
  let base: Base = new Base()
  let derived: Derived
  
  // 编译失败：Base 不是 Derived 的子类型
  derived = base  // Error: Type 'Base' is not assignable to type 'Derived'
}
