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
 * @id SEM_15_11_00_004_PASS_EXPLICIT_overload
 * @expect compile-pass
 * @section 15.11
 * @design 规范 15.11.1：显式重载声明允许开发者显式指定重载实体集
 * @note 测试显式重载声明
 */

// 测试显式重载声明
function fooNumber(n: number): string {
  return 'number: ' + n
}

function fooString(s: string): string {
  return 'string: ' + s
}

function fooBoolean(b: boolean): string {
  return 'boolean: ' + b
}

// 显式重载声明
overload foo { fooNumber, fooString, fooBoolean }

function testExplicitOverload(): void {
  // 重载解析：根据显式重载声明顺序选择
  let result1: string = foo(42)  // 调用 fooNumber
  console.log(result1)  // 输出: "number: 42"
  
  let result2: string = foo('hello')  // 调用 fooString
  console.log(result2)  // 输出: 'string: hello'
    
  let result3: string = foo(true)  // 调用 fooBoolean
  console.log(result3)  // 输出: 'boolean: true'
    
  console.log('Explicit overload test passed')
}
