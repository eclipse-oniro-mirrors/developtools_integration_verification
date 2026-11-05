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
 * @id EXP_07_02_02_011_PASS_NORMAL_TERNARY
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证三元表达式正常完成：条件求值无错误抛出
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: int = 10;
  let b: int = 20;
  let max: int = a > b ? a : b;
  let min: int = a < b ? a : b;
  let label: string = max > 0 ? 'positive' : 'non-positive';
  console.log('' + max + min + label);
}
