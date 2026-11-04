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
 * @id CON_06_01_010_PASS_COMPOSITE_ARRAY_BASIC
 * @expect compile-pass
 * @section 6.1
 * @design Composite literal context: 数组字面量元素类型与数组元素类型完全匹配
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCompositeArrayBasic(): void {
  let intArr: int[] = [1, 2, 3, 4, 5]
  let strArr: string[] = ['a','b','c']
  let boolArr: boolean[] = [true, false, true]

  let lenInt: int = intArr[0]
  let lenStr: string = strArr[1]
}
