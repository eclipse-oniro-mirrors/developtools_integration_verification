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
 * @id SEM_15_14_00_007_PASS_FOR_loop
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：for 循环的扩展语义（真值检查）
 * @note 测试 for 循环的扩展语义
 */

// 测试 for 循环的扩展语义
function testForLoopExtended(): void {
  // 数字的真值检查
  for (let i = 10; i; i--) {
    console.log('For loop (number): ' + i)
  }
  // 输出: 10, 9, 8, ..., 1
  
  // 字符串的真值检查
  let str: string = 'hello'
  for (; str; ) {
    console.log('For loop (string): ' + str)
    str = ''
    break  // 简化示例
  
}
console.log('For loop extended semantics test passed')
}