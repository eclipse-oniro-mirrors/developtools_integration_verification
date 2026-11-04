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
 * @id EXP_07_32_01_011_RUNTIME_RANGEERROR_NEGATIVE
 * @expect runtime
 * @runtime-throws=RangeError
 * @section 7.32.1
 * @design 验证数组索引为负值时抛出 RangeError：使用函数返回负值作索引，arr[negOne()] = value 应抛 RangeError
 * @note 运行时异常用例：不直接使用字面量负值（编译器会静态捕获），而是通过函数调用返回负值来测试运行时 RangeError
 */

function negOne(): int {
  return -1;
}

function main(): void {
  let arr: int[] = [1, 2, 3];
  arr[negOne()] = 99;  // 应抛出 RangeError（通过函数调用返回 -1 绕过编译期检测）
  console.log('verified');
}
