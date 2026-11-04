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
 * @id EXP_07_32_03_014_FAIL_ARRAY_LITERAL_LHS
 * @expect compile-fail
 * @section 7.32.3
 * @design 验证数组字面量（Array Literal）不能作为左值表达式：[1, 2, 3] 不可出现在赋值左侧
 * @note 反向用例：数组字面量不是五种有效左值形式之一，应产生 compile-time error
 */
function main(): void {
  let x: int[] = [0, 0, 0];

  // 数组字面量作为左值（应报错）
  [1, 2, 3] = x;

  console.log('verified');
}
