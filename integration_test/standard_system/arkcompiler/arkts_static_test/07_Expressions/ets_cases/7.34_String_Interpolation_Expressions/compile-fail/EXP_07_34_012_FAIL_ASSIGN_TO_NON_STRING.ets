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
 * @id EXP_07_34_012_FAIL_ASSIGN_TO_NON_STRING
 * @expect compile-fail
 * @section 7.34
 * @design 验证字符串插值结果（类型为 string）不能赋值给非 string 类型的变量，如 int
 * @note 反向用例：插值表达式的结果类型为 string，赋值给 int 应产生类型不匹配的 compile-time error
 */
function main(): void {
  let x: int = 42;

  // 插值结果类型为 string，不能赋值给 int
  let y: int = `${x}`;

  console.log('verified');
}
