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
 * @id SEM_15_14_00_017_PASS_NULL_UNDEFINED_truthiness
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：null 和 undefined 的真值检查
 * @note 测试 null 和 undefined 的真值检查
 */

// 测试 null 和 undefined 的真值检查
function testNullUndefinedTruthiness(): void {
  // null 的真值检查
  let n: null = null
  if (!n) {
    console.log('null is falsy')  // 输出：null is falsy
  }
  
  // undefined 的真值检查
  let u: undefined = undefined
  if (!u) {
    console.log('undefined is falsy')  // 输出：undefined is falsy
  }
  
  // null 和 undefined 的联合类型真值检查
  let nu: null | undefined = null
  if (!nu) {
    console.log('null|undefined is falsy')  // 输出：null|undefined is falsy
  }
  
  nu = undefined
  if (!nu) {
    console.log('null|undefined is falsy')  // 输出：null|undefined is falsy
  
}
console.log('Null/undefined truthiness test passed')
}