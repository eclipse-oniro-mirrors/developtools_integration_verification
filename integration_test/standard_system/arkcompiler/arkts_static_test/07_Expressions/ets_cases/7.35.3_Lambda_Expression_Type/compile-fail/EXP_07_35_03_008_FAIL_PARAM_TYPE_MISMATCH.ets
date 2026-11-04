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
 * @id EXP_07_35_03_008_FAIL_PARAM_TYPE_MISMATCH
 * @expect compile-fail
 * @section 7.35.3
 * @design 验证 Lambda 表达式参数类型与目标函数类型不匹配时产生编译时错误
 * @note 反向用例：参数类型不匹配应产生编译错误
 */
function main(): void {
  // 参数类型不匹配：目标为 (int) => int，但 lambda 参数为 string
  const f: (x: int) => int = (s: string): int => s.length
  let r: int = f(42)
  console.log('' + r)
}
