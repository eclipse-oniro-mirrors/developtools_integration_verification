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
 * @id EXP2_17_08_01_009_FAIL_FOR_OF_INT_ON_STRING_ARRAY
 * @expect compile-fail
 * @section 17.8.1
 * @design for-of 循环变量显式标注 int 类型遍历 string[] 数组：string 不能赋值给 int，应产生编译时错误
 * @note 反向用例：验证该场景应产生编译时错误
 */
function testForOfIntOnStringArray(): void {
  let arr: string[] = ['a', 'b', 'c']
  for (let n: int of arr) {
    console.log(n)
  }
}
