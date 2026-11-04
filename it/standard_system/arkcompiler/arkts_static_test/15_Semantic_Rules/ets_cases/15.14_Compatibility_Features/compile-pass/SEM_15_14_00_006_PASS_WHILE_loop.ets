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
 * @id SEM_15_14_00_006_PASS_WHILE_loop
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：while 循环的扩展语义（真值检查）
 * @note 测试 while 循环的扩展语义
 */

// 测试 while 循环的扩展语义
function testWhileLoopExtended(): void {
  // 数字的真值检查
  let num: number = 10
  while (num) {
    console.log('While loop (number): ' + num)
    num--
    if (num == 0) { break }
  }
  // 输出: 10, 9, 8, ..., 1
  
  // 字符串的真值检查
  let str: string = 'hello'
  while (str) {
    console.log('While loop (string): ' + str)
    str = ''
    break  // 简化示例
  
}
console.log('While loop extended semantics test passed')
}