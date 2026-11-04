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
 * @id EXP_07_35_01_011_FAIL_MULTI_PARAM_NO_INFERENCE
 * @expect compile-fail
 * @section 7.35.1
 * @design 验证多参数 Lambda 未提供参数类型且无法通过类型推断推导时产生编译时错误
 * @note 反向用例：(a, b) => a + b 无参数类型且无推断上下文，应产生编译时错误
 */
function main(): void {
  // 多参数无类型且无目标类型上下文
  const f = (a, b) => a + b
  console.log('' + f(1, 2))
}
