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
 * @id EXP2_17_09_006_FAIL_OVERLOAD_NOMATCHINGSIGNATURE
 * @expect compile-fail
 * @section 17.9
 * @design 调用 overload 但无匹配签名 — 编译时错误
 * @note 反向用例：参数类型不匹配任何候选
 */
function fInt(a: int): string { return 'int' }
function fStr(a: string): string { return 'str' }
overload f { fInt, fStr }

function main(): void {
  // boolean 不在任何签名的参数类型中
  let x: boolean = f(true)
}
