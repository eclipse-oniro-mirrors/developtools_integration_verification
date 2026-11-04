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
 * @id EXP_07_12_01_010_FAIL_SPREAD_NON_ITERABLE
 * @expect compile-fail
 * @section 7.12.1
 * @design 验证 spread expression 必须为 iterable 或 tuple 类型
 * @note 反向用例：非 iterable 类型（如 int）在 rest parameter 中 spread 应报编译时错误
 *       spread expression 要求 "Any iterable or tuple object referred by the expression"
 */
function foo(...args: int[]): void {
}

function main(): void {
  foo(...42);
}
