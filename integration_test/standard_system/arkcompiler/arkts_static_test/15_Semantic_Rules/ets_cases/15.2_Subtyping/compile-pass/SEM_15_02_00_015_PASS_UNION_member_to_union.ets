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
 * @id SEM_15_02_00_015_PASS_UNION_member_to_union
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.5：联合类型 U(U1|...|Un) 是类型 T 的子类型，如果每个 Ui 都是 T 的子类型
 * @note 测试联合类型的子类型关系：每个成员都是目标类型的子类型
 */

// 测试联合类型的子类型关系
class Base {
  public name: string = 'base'
}

class Derived1 extends Base {
  public value1: number = 1
}

class Derived2 extends Base {
  public value2: string = 'two'
}

function testUnionSubtype(): void {
  let unionVar: Derived1 | Derived2
  let baseVar: Base
  
  // Derived1 | Derived2 是 Base 的子类型（因为每个成员都是 Base 的子类型）
  unionVar = new Derived1()
  baseVar = unionVar  // OK: Derived1|Derived2 <: Base
  
  console.log(baseVar.name)
  
  // 测试规范中的示例
  let x: Base
  let y: Derived1 | Derived2
  
  x = y  // OK: both Derived1 and Derived2 are subtypes of Base
}
