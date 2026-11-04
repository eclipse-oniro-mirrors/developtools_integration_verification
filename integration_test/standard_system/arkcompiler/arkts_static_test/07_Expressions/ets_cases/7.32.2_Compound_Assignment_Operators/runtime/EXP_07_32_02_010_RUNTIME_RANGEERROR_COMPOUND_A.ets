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
 * @id EXP_07_32_02_010_RUNTIME_RANGEERROR_COMPOUND_A
 * @expect runtime
 * @section 7.32.2
 * @design 验证数组复合赋值在越界时的 RangeError：负索引（通过函数返回 -1）和索引 >= length 时应抛出 RangeError
 * @note 运行时异常用例：使用函数返回运行时负索引，避免编译时字面量检查（ESE0247）。使用 @runtime-throws=RangeError 标记
 * @runtime-throws=RangeError
 */

// 函数返回 -1 以绕过编译期字面量负索引检查
function negOne(): int {
  return -1;
}

// 函数返回超长索引
function tooBig(): int {
  return 5;
}

function main(): void {
  let arr: int[] = [10, 20, 30];

  // 负索引复合赋值：arr[-1] += 99 → RangeError
  arr[negOne()] += 99;

  // 不会执行到此处
  console.log('verified');
}
