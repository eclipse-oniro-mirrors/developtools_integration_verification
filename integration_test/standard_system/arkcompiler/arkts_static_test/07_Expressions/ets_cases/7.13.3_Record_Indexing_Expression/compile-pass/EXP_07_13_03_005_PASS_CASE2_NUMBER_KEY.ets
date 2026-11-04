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
 * @id EXP_07_13_03_005_PASS_CASE2_NUMBER_KEY
 * @expect compile-pass
 * @section 7.13.3
 * @design Case 2: Key 为非字面量联合类型（如 number），索引无限制，结果类型为 Value | undefined
 * @note 正向用例：Record<number, string> 使用 number 变量索引，编译通过
 */
function main(): void {
  let x: Record<number, string> = {
    1: 'hello',
    2: 'bye'
  };
  let n: number = 1;
  let s: string | undefined = x[n];
}
