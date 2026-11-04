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
 * @id EXP_07_32_03_004_PASS_ARRAY_INDEX_LHS
 * @expect compile-pass
 * @section 7.32.3
 * @design 验证数组索引访问（Array Indexing）作为左值表达式的编译通过：常量索引、变量索引均可作为赋值目标
 * @note 正向用例：数组索引表达式 arr[idx] 是五种有效左值形式之一，验证数组元素赋值编译通过
 */
function main(): void {
  let arr: int[] = [0, 0, 0, 0, 0];

  // 常量索引作为左值
  arr[0] = 10;

  // 变量索引作为左值
  let idx: int = 2;
  arr[idx] = 30;

  // 表达式索引作为左值
  arr[1 + 1] = 50;

  // 字符串数组索引作为左值
  let strArr: string[] = ["', '', '"];
  strArr[0] = 'hello';

  // boolean 数组索引作为左值
  let boolArr: boolean[] = [false, false];
  boolArr[1] = true;

  // double 数组索引作为左值
  let dblArr: double[] = [0.0, 0.0];
  dblArr[0] = 3.14;

  console.log('verified');
}
