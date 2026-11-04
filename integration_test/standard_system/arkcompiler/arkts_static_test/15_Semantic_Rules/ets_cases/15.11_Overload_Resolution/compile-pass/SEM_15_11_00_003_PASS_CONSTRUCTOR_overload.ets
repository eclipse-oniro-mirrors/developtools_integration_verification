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
 * @id SEM_15_11_00_003_PASS_CONSTRUCTOR_overload
 * @expect compile-pass
 * @section 15.11
 * @design 规范 15.11.6：类的构造函数重载集包含隐式重载的构造函数
 * @note 测试构造函数重载解析
 */

// 测试构造函数重载解析
class Person {
  public name: string
  public age: number
  
  // 构造函数重载
  constructor(name: string) {
    this.name = name
    this.age = 0
  }
  
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
  
  getInfo(): string {
    return this.name + ' (' + this.age + ')'
  }
}

function testConstructorOverload(): void {
  // 重载解析：选择第一个匹配的构造函数
  let p1: Person = new Person('Alice')  // 调用 constructor(name: string)
  console.log(p1.getInfo())  // 输出: Alice (0)
  
  let p2: Person = new Person('Bob', 30)  // 调用 constructor(name: string, age: number)
  console.log(p2.getInfo())  // 输出: Bob (30)
  
  console.log('Constructor overload test passed')
}
