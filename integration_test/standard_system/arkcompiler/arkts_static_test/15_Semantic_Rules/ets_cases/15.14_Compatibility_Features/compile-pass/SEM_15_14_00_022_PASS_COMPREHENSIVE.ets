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
 * @id SEM_15_14_00_022_PASS_COMPREHENSIVE
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：综合测试扩展条件表达式
 * @note 综合测试扩展条件表达式的各种情况
 */

// 综合测试扩展条件表达式
function testComprehensiveExtendedConditional(): void {
  // 综合测试：数字、字符串、布尔值、null、undefined
  let value: number | string | boolean | null | undefined = 42
  
  // 使用扩展条件表达式
  let result: string = value ? 'truthy' : 'falsy'
  console.log('Comprehensive test 1: ' + result)
  
  value = 'hello'
  result = value ? 'truthy' : 'falsy'
  console.log('Comprehensive test 2: ' + result)
  
  value = true
  result = value ? 'truthy' : 'falsy'
  console.log('Comprehensive test 3: ' + result)
  
  value = null
  result = value ? 'truthy' : 'falsy'
  console.log('Comprehensive test 4: ' + result)
  
  value = undefined
  result = value ? 'truthy' : 'falsy'
  console.log('Comprehensive test 5: ' + result)
  
  console.log('Comprehensive extended conditional test passed')
}