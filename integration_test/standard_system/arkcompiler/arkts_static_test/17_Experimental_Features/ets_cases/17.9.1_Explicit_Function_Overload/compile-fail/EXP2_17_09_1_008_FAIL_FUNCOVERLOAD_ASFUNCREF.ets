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
 * @id EXP2_17_09_1_008_FAIL_FUNCOVERLOAD_ASFUNCREF
 * @expect compile-fail
 * @section 17.9.1
 * @design overload 名不在 Function Reference 中考虑
 * @note 反向用例：尝试将 overload 名作为函数引用赋值给函数类型变量
 */
function fInt(a: int): int { return a }
function fStr(a: string): string { return a }
overload f { fInt, fStr }

function main(): void {
  // overload 名不能作为函数引用 — 应编译失败
  let fn: (a: int) => int = f
}
