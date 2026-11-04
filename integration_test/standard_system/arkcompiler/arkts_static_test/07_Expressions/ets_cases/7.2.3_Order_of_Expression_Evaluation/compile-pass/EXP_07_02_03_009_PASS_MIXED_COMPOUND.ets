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
 * @id EXP_07_02_03_009_PASS_MIXED_COMPOUND
 * @expect compile-pass
 * @section 7.2.3
 * @design 验证混合复合表达式编译通过：多种运算符组合的求值顺序
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function track(s: string): int {
  return 1;
}

function main(): void {
  let a: int = track('a') + track('b') * track('c') - track('d');
  let b: boolean = (track('x') > 0) && (track('y') < 10);
  let c: int = track('cond') > 0 ? track('t') : track('f');
  console.log('' + a + b + c);
}
