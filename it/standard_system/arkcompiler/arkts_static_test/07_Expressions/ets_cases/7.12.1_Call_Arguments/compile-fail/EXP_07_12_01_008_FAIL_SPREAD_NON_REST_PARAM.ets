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
 * @id EXP_07_12_01_008_FAIL_SPREAD_NON_REST_PARAM
 * @expect compile-fail
 * @section 7.12.1
 * @design 验证 spread expression 用于非 rest parameter：仅 rest parameter 可用 spread
 * @note 反向用例：func(...arr) 中参数非 rest，spread 展开应报编译时错误
 */
function add(a: int, b: int): int {
  return a + b;
}

function main(): void {
  let arr: int[] = [1, 2];
  let r: int = add(...arr);
}
