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
 * @id EXP_07_02_03_004_PASS_SHORT_OR_FALSE
 * @expect compile-pass
 * @section 7.2.3
 * @design 验证 || 短路求值编译通过：左为 false 时右操作数被求值
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function track(s: string): boolean {
  return s == 'true';
}

function main(): void {
  let a: boolean = track('false') || track('right');
  let b: boolean = (1 > 2) || track('also right');
  console.log('' + a + b);
}
