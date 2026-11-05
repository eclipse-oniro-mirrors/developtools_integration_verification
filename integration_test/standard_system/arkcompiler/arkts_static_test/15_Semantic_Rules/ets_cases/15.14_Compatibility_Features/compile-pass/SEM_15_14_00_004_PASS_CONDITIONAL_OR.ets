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
 * @id SEM_15_14_00_004_PASS_CONDITIONAL_OR
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：条件或表达式的扩展语义
 * @note 测试条件或表达式
 */

// 测试条件或表达式
function testConditionalOr(): void {
  // 数字的条件或
  let num: number = 10
  let result1: number | string = num || 'truthy'
  console.log('Conditional OR (number): ' + result1)  // 输出: 10
  
  let zero: number = 0
  let result2: number | string = zero || 'falsy'
  console.log('Conditional OR (zero): ' + result2)  // 输出: 'falsy'
  
  // 字符串的条件或
  let str: string = 'hello'
  let result3: string | boolean = str || false
  console.log('Conditional OR (string): ' + result3)  // 输出: 'hello'
  
  let empty: string = ''
  let result4: string | boolean = empty || true
  console.log('Conditional OR (empty): ' + result4)  // 输出: true
    
  console.log('Conditional OR test passed')
}