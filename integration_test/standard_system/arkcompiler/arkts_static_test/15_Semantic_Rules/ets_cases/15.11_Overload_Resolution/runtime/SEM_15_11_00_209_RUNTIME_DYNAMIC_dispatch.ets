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
 * @id SEM_15_11_00_209_RUNTIME_DYNAMIC_dispatch
 * @expect runtime
 * @section 15.11
 * @design 规范 15.11.10：实例方法调用的实际方法在运行时根据对象的实际类型确定
 * @note 测试动态方法分派
 */

// 测试动态方法分派
class Base {
  public name: string = 'Base'
  
  method(): string {
    return 'Base.method()'
  }
}

class Derived extends Base {
  override method(): string {
    return 'Derived.method()'
  }
  
  extraMethod(): string {
    return 'Derived.extraMethod()'
  }
}

class Derived2 extends Derived {
  override method(): string {
    return 'Derived2.method()'
  }
}

function testDynamicDispatch(): void {
  // 编译时类型是 Base，运行时类型可能是 Derived 或 Derived2
  let base: Base = new Base()
  console.log('1. ' + base.method())  // 输出: Base.method()
  
  base = new Derived()
  console.log('2. ' + base.method())  // 输出: Derived.method()
  
  base = new Derived2()
  console.log('3. ' + base.method())  // 输出: Derived2.method()
  
  // 测试多级继承的方法分派
  let derived: Derived = new Derived2()
  console.log('4. ' + derived.method())  // 输出: Derived2.method()
  
  console.log('Dynamic dispatch test passed')
}

// 运行测试
test_dynamic_dispatch()
