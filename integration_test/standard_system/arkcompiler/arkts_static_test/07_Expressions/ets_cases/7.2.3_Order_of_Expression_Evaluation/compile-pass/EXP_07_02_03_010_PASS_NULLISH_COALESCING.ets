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
 * @id EXP_07_02_03_010_PASS_NULLISH_COALESCING
 * @expect compile-pass
 * @section 7.2.3
 * @design 验证 nullish 合并求值顺序编译通过：?? 在特定情况下短路
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function track(): int {
  return 1;
}

function main(): void {
  let a: int | undefined = undefined;
  let b: int = a ?? track();
  let c: int = 42 ?? track();
  let d: int = (a ?? 0) + 1;
  console.log('' + b + c + d);
}
