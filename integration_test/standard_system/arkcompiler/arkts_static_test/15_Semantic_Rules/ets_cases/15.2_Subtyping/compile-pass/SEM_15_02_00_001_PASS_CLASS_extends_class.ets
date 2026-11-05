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
 * @id SEM_15_02_00_001_PASS_CLASS_extends_class
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.1：类 S 扩展类 T，则 S <: T（S 是 T 的子类型）
 * @note 测试类继承关系的子类型：Derived extends Base，Derived 可赋给 Base
 */

// 测试类扩展的子类型关系
class Base {
  public name: string = 'Base'
}

class Derived extends Base {
  public extra: number = 42
}

function testClassExtendsSubtype(): void {
  let base: Base = new Base()
  let derived: Derived = new Derived()
  
  // Derived 是 Base 的子类型，可以赋值给 Base 类型变量
  base = derived  // OK: Derived <: Base
  
  // 验证可以通过 Base 类型变量访问 Base 成员
  console.log(base.name)
}

