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
 * @id EXP_07_33_014_FAIL_TYPE_MISMATCH_ASSIGNMENT
 * @expect compile-fail
 * @section 7.33
 * @design 验证三元表达式结果类型为联合类型时，赋值给不兼容的单一类型应产生编译时错误：condition?"hello":42 → string|int 不可赋值给 int
 * @note 反向用例：三元结果为 string|int，但目标变量类型为 int，类型不兼容应报错
 */
function main(): void {
  let cond: boolean = true;
  // string|int 不可赋值给 int
  let x: int = cond ? 'hello' : 42;
}
