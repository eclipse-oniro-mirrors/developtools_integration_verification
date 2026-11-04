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
 * @id EXP_07_35_01_010_FAIL_NO_TYPE_NO_INFERENCE
 * @expect compile-fail
 * @section 7.35.1
 * @design 验证形式参数未提供类型且无法通过类型推断推导时产生编译时错误：独立 Lambda 无目标类型上下文
 * @note 反向用例：const f = x => x，Lambda 没有类型注解且 const 推断缺乏目标类型上下文，应产生编译时错误
 */
function main(): void {
  // 无参数类型且无目标类型上下文
  const f = x => x
  console.log('' + f(42))
}
