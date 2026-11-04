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
 * @id EXP_07_02_03_002_PASS_TERNARY_FIRST
 * @expect compile-pass
 * @section 7.2.3
 * @design 验证三元条件优先求值编译通过：条件先求值，仅一个分支被求值
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function track(s: string): int {
  return 1;
}

function main(): void {
  let a: int = track('cond') > 0 ? track('true') : track('false');
  let b: int = (track('a') + 1) > 0 ? track('b') : track('c');
  console.log('' + a + b);
}
