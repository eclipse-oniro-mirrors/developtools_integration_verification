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
 * @id SEM_15_09_00_007_PASS_CLASS_override_keyword
 * @expect compile-pass
 * @section 15.9
 * @design 规范 15.9.1：重写方法必须使用 override 关键字
 * @note 测试 override 关键字的使用
 */

// 测试 override 关键字的使用
class Base {
  method(): void {
    console.log('Base method')
}
  
  getValue(): number {
    return 42
  }
}

class Derived extends Base {
  // 必须使用 override 关键字
  override method(): void {
    console.log('Derived method')
}
  
  // 重写并返回协变类型
  override getValue(): number {
    return 100
  }
}

function testOverrideKeyword(): void {
  let derived: Derived = new Derived()
  
  // 调用重写的方法
  derived.method()
  
  let value: number = derived.getValue()
  console.log('Value: ' + value)
  
  let base: Base = derived
  base.method()  // 运行时调用 Derived.method()
}
