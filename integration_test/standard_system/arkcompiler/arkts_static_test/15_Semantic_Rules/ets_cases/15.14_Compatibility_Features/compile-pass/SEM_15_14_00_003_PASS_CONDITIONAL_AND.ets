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
 * @id SEM_15_14_00_003_PASS_CONDITIONAL_AND
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：条件与表达式的扩展语义
 * @note 测试条件与表达式
 */

// 测试条件与表达式
function testConditionalAnd(): void {
  // 数字的条件与
  let num: number = 10
  let result1: number | string = num && 'truthy'
  console.log('Conditional AND (number): ' + result1)  // 输出: 'truthy'
  
  let zero: number = 0
  let result2: number | string = zero && 'truthy'
  console.log('Conditional AND (zero): ' + result2)  // 输出: 0
  
  // 字符串的条件与
  let str: string = 'hello'
  let result3: string = str && 'truthy'
  console.log('Conditional AND (string): ' + result3)  // 输出: 'truthy'
  
  let empty: string = ''
  let result4: string = empty && 'truthy'
  console.log('Conditional AND (empty): ' + result4)  // 输出: ""
  
  console.log('Conditional AND test passed')
}