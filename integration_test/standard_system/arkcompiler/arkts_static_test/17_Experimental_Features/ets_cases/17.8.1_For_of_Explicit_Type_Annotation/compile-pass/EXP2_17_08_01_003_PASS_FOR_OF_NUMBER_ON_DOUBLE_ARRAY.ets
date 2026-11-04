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
 * @id EXP2_17_08_01_003_PASS_FOR_OF_NUMBER_ON_DOUBLE_ARRAY
 * @expect compile-pass
 * @section 17.8.1
 * @design for-of 循环变量显式标注 number 类型遍历 double[] 数组：number 是 double 的别名，类型兼容
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testForOfNumberOnDoubleArray(): void {
  let arr: double[] = [1.1, 2.2, 3.3, 4.4]
  let sum: double = 0.0
  for (let n: number of arr) {
    sum = sum + n
  }
  console.log(sum)
}
