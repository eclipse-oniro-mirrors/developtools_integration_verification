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
 * @id SEM_15_14_00_008_PASS_IF_statement
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：if 语句的扩展语义（真值检查）
 * @note 测试 if 语句的扩展语义
 */

// 测试 if 语句的扩展语义
function testIfStatementExtended(): void {
  // 数字的真值检查
  let num: number = 10
  if (num) {
    console.log('If (number): ' + num)  // 输出: 10
  }
  
  let zero: number = 0
  if (zero) {
    console.log('This won't execute')
} else {
    console.log('Zero is falsy')  // 输出: Zero is falsy}
  
  // 字符串的真值检查
  let str: string = 'hello'
  if (str) {
    console.log('If (string): ' + str)  // 输出: hello
  }
  
  let empty: string = ''
  if (empty) {
    console.log('This won't execute')
} else {
    console.log('Empty string is falsy')  // 输出: Empty string is falsy}
  
  // 布尔值的真值检查
  let bool: boolean = true
  if (bool) {
    console.log('If (boolean): ' + bool)  // 输出: true
  
}
console.log('If statement extended semantics test passed')
}