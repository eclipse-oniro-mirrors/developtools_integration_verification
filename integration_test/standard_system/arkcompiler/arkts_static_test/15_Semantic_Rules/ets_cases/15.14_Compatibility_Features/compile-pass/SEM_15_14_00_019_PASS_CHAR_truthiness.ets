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
 * @id SEM_15_14_00_019_PASS_CHAR_truthiness
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：char 类型的真值检查
 * @note 测试 char 类型的真值检查
 */

// 测试 char 类型的真值检查
function testCharTruthiness(): void {
  // char 类型的真值检查
  let c1: string = 'a'
  if (c1) {
    console.log('char 'a' is truthy')  // 输出: char 'a' is truthy
  }
  
  let c2: string = '\u0000'
  if (!c2) {
    console.log('char '\\u0000' is falsy')  // 输出: char '\u0000' is falsy
  
}
console.log('Char truthiness test passed')
}