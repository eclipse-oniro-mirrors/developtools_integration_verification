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
 * @id SEM_15_14_00_002_PASS_LOGICL_COMPLEMENT
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：逻辑补码的扩展语义
 * @note 测试逻辑补码
 */

// 测试逻辑补码
function testLogicalComplement(): void {
  // 布尔值的逻辑补码
  let bool: boolean = true
  let notBool: boolean = !bool
  console.log('Logical complement (boolean): ' + notBool)  // 输出: false
  
  // 数字的逻辑补码
  let num: number = 10
  let notNum: boolean = !num
  console.log('Logical complement (number): ' + notNum)  // 输出: false (因为 10 是真值)
  
  let zero: number = 0
  let notZero: boolean = !zero
  console.log('Logical complement (zero): ' + notZero)  // 输出: true (因为 0 是假值)
  
  // 字符串的逻辑补码
  let str: string = 'hello'
  let notStr: boolean = !str
  console.log('Logical complement (string): ' + notStr)  // 输出: false (因为 'hello' 是真值)
  
  let empty: string = ''
  let notEmpty: boolean = !empty
  console.log('Logical complement (empty): ' + notEmpty)  // 输出: true (因为 "" 是假值)
  
  console.log('Logical complement test passed')
}