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
 * @id EXP_07_12_01_005_PASS_SPREAD_REST_PARAM
 * @expect compile-pass
 * @section 7.12.1
 * @design 验证 spread expression 用于 rest parameter：仅 rest parameter 可用 spread
 * @note 正向用例：func(...rest) 中 rest 是 rest parameter，spread 展开合法
 */
function sumAll(...numbers: int[]): int {
  let s: int = 0;
  for (let i: int = 0; i < numbers.length; i++) {
    s = s + numbers[i];
  }
  return s;
}

function main(): void {
  let arr: int[] = [1, 2, 3, 4, 5];
  let r: int = sumAll(...arr);
}
