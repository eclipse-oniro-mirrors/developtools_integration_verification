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
 * @id SEM_15_02_00_119_FAIL_GEN_invariant_assignment
 * @expect compile-fail
 * @section 15.2
 * @design 规范 15.2.2：泛型类 C<T> 对于不同的类型参数 T1 和 T2，C<T1> 和 C<T2> 之间没有子类型关系（不变性）
 * @note 测试泛型不变性：不能将 C<Derived> 赋值给 C<Base>
 */

// 测试泛型不变性（编译失败）
class Base {
  public name: string = 'base'
}

class Derived extends Base {
  public extra: number = 42
}

class Container<T> {
  public value: T
  
  constructor(v: T) {
    this.value = v
  }
}

function testGenericInvariance(): void {
  let derivedContainer: Container<Derived> = new Container<Derived>(new Derived())
  let baseContainer: Container<Base>
  
  // 编译失败：Container<Derived> 不是 Container<Base> 的子类型（不变性）
  baseContainer = derivedContainer  // Error: Type 'Container<Derived>' is not assignable to type 'Container<Base>'
}
