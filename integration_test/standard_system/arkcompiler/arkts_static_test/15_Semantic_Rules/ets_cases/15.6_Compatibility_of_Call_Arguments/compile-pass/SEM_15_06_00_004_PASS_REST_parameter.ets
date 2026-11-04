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
 * @id SEM_15_06_00_004_PASS_REST_parameter
 * @expect compile-pass
 * @section 15.6
 * @design 规范 15.6：调用参数兼容性检查，包括剩余参数的匹配
 * @note 测试剩余参数匹配
 */

// 测试剩余参数匹配
function testRestParameter(): void {
  // 剩余参数匹配
  function sum(...args: number[]): number {
    let total: number = 0
    for (let i = 0; i < args.length; i++) {
      total += args[i]
    }
    return total
  }
  
  // 调用带有剩余参数的函数
  let result1: number = sum(1, 2, 3)
  console.log('Sum (1,2,3): ' + result1)  // 输出: 6
  
  let result2: number = sum(10, 20, 30, 40, 50)
  console.log('Sum (10,20,30,40,50): ' + result2)  // 输出: 150
  
  // 使用 spread 表达式调用
  let arr: number[] = [1, 2, 3, 4, 5]
  let result3: number = sum(...arr)
  console.log('Sum (spread): ' + result3)  // 输出: 15
  
  console.log('Rest parameter test passed')
}

// 测试元组剩余参数
function testTupleRestParameter(): void {
  function process(first: string, ...rest: number[]): void {
    console.log('First: ' + first)
    console.log('Rest: ' + rest)
  }
  
  process('hello', 1, 2, 3)
  // 输出: First: hello
  // 输出: Rest: 1,2,3
  
  console.log('Tuple rest parameter test passed')
}
