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
 * @id SEM_15_11_00_002_PASS_METHOD_overload_resolution
 * @expect compile-pass
 * @section 15.11
 * @design 规范 15.11.5：类实例方法的重载集包含类定义的方法和继承的方法
 * @note 测试类实例方法重载解析
 */

// 测试类实例方法重载解析
class Calculator {
  // 方法重载
  add(a: number, b: number): number {
    return a + b
  }
  
  add(a: string, b: string): string {
    return a + b
  }
  
  add(a: number[], b: number[]): number {
    return a[0] + b[0]
  }
}

function testMethodOverloadResolution(): void {
  let calc: Calculator = new Calculator()
  
  // 重载解析：选择第一个匹配的方法
  let result1: number = calc.add(1, 2)  // 调用 add(a: number, b: number)
  console.log('Number add: ' + result1)  // 输出: 3
  
  let result2: string = calc.add('hello', 'world')  // 调用 add(a: string, b: string)
  console.log('String add: ' + result2)  // 输出: helloworld
  
  let result3: number = calc.add([10, 20], [30, 40])  // 调用 add(a: number[], b: number[])
  console.log('Array add: ' + result3)  // 输出: 40
  
  console.log('Method overload resolution test passed')
}
