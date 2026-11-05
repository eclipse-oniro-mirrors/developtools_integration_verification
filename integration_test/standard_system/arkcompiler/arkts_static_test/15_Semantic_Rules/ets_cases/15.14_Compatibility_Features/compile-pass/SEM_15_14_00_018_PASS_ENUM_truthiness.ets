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
 * @id SEM_15_14_00_018_PASS_ENUM_truthiness
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：枚举类型的真值检查
 * @note 测试枚举类型的真值检查
 */

// 测试枚举类型的真值检查
enum Color {
  Red,
  Green,
  Blue
}

function testEnumTruthiness(): void {
  let c: Color = Color.Red
  
  // 枚举值的真值检查
  if (c) {
    console.log('Color is truthy: ' + c)  // 输出: 0 (Color.Red 的值)
  
}
console.log('Enum truthiness test passed')
}