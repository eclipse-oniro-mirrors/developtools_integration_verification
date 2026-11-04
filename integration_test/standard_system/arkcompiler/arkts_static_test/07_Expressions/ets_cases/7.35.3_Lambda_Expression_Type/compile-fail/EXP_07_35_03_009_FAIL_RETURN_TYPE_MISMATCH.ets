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
 * @id EXP_07_35_03_009_FAIL_RETURN_TYPE_MISMATCH
 * @expect compile-fail
 * @section 7.35.3
 * @design 验证 Lambda 表达式返回类型与目标函数类型不匹配时产生编译时错误
 * @note 反向用例：返回类型不匹配应产生编译错误
 */
function main(): void {
  // 返回类型不匹配：目标为 () => string，但 lambda 返回 int
  const f1: () => string = (): int => 42
  let r1: string = f1()
  console.log('' + r1)
}
