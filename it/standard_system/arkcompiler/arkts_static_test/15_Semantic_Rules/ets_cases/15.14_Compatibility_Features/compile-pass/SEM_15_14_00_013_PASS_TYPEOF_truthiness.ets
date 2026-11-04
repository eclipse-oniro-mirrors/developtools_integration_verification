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
 * @id SEM_15_14_00_013_PASS_TYPEOF_truthiness
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：typeof 表达式的真值检查
 * @note 测试 typeof 表达式的真值检查
 */

// 测试 typeof 表达式的真值检查
function testTypeofTruthiness(): void {
  let x: string | number | boolean | undefined | Object = 'hello'
  
  // typeof 返回字符串字面量类型的真值检查
  if (typeof x === 'string') {
    console.log('x is string')
}
  
  if (typeof x === 'number') {
    console.log('x is number')
}
  
  if (typeof x === 'boolean') {
    console.log('x is boolean')
}
  
  if (typeof x === 'undefined') {
    console.log('x is undefined')
}
  
  if (typeof x === 'object') {
    console.log('x is object')
}
console.log('Typeof truthiness test passed')
}