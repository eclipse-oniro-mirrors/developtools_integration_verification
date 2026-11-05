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
 * @id SEM_15_14_00_021_PASS_OBJECT_truthiness
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：object 类型的真值检查
 * @note 测试 object 类型的真值检查
 */

// 测试 object 类型的真值检查
function testObjectTruthiness(): void {
  // object 类型的真值检查
  let obj1: Object = {}
  if (obj1) {
    console.log('Object is truthy')  // 输出: Object is truthy
  }
  
  let obj2: Object = {}
  if (obj2) {
    console.log('Empty object is truthy')  // 输出: Empty object is truthy
  
}
console.log('Object truthiness test passed')
}