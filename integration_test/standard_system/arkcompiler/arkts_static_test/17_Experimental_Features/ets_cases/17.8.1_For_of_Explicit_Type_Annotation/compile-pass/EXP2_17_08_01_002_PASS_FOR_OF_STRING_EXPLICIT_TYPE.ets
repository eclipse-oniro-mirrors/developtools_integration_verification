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
/**
 * @id EXP2_17_08_01_002_PASS_FOR_OF_STRING_EXPLICIT_TYPE
 * @expect compile-pass
 * @section 17.8.1
 * @design for-of 循环变量显式标注 string 类型遍历 string[] 数组：验证标注类型与元素类型匹配
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testForOfStringExplicitType(): void {
  let arr: string[] = ['hello', 'world', 'arkts']
  let result: string = ''
  for (let s: string of arr) {
    result = result + s
  }
  console.log(result)
}
