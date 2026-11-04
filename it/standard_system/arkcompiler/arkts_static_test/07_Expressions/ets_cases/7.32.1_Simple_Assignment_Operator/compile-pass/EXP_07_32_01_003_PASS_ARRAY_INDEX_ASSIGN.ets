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
 * @id EXP_07_32_01_003_PASS_ARRAY_INDEX_ASSIGN
 * @expect compile-pass
 * @section 7.32.1
 * @design 验证数组索引表达式作为左值 arr[idx] = value 的编译通过：字面量索引和变量索引两种形式
 * @note 正向用例：验证 a[i] = rhs 形式编译通过，包括 int/long/string/boolean 数组。long 数组元素使用 int 字面量
 */
function main(): void {
  let intArr: int[] = [0, 0, 0];
  let longArr: long[] = [0, 0, 0];
  let strArr: string[] = ["', '', '"];
  let boolArr: boolean[] = [false, false, false];

  // 字面量索引
  intArr[0] = 42;
  intArr[1] = 100;
  intArr[2] = -1;

  // 变量索引
  let idx: int = 1;
  intArr[idx] = 77;

  // long 数组
  longArr[0] = 1000;
  longArr[1] = 2000;

  // string 数组
  strArr[0] = 'hello';
  strArr[2] = 'world';

  // boolean 数组
  boolArr[1] = true;
  boolArr[0] = false;

  // 表达式索引
  intArr[(1 + 0)] = 55;

  // 多个元素连续赋值
  for (let i: int = 0; i < 3; i = i + 1) {
    intArr[i] = i * 10;
  }
console.log('verified');
}
