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
 * @id SEM_15_11_00_001_PASS_FUNCTION_overload_resolution
 * @expect compile-pass
 * @section 15.11
 * @design 规范 15.11：重载解析选择第一个匹配的重载实体
 * @note 测试函数重载解析
 */

// 测试函数重载解析
function foo(n: number): string {
  return 'number: ' + n
}

function foo(s: string): string {
  return 'string: ' + s
}

function testFunctionOverloadResolution(): void {
  // 重载解析：选择第一个匹配的函数
  let result1: string = foo(42)  // 调用 foo(n: number)
  console.log(result1)  // 输出: "number: 42"
  
  let result2: string = foo('hello')  // 调用 foo(s: string)
  console.log(result2)  // 输出: 'string: hello'
  
  console.log('Function overload resolution test passed')
}
