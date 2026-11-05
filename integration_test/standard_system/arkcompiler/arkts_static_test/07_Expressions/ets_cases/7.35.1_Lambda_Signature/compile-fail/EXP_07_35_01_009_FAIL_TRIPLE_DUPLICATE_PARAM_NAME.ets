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
 * @id EXP_07_35_01_009_FAIL_TRIPLE_DUPLICATE_PARAM_NAME
 * @expect compile-fail
 * @section 7.35.1
 * @design 验证 Lambda 表达式多个形式参数中存在同名参数（三个参数中两个同名）时产生编译时错误
 * @note 反向用例：Lambda 签名中 a 重复出现，应产生编译时错误
 */
function main(): void {
  // 三个参数中 a 重复（第一个和第三个同名）
  const f: (x: int, y: int, z: int) => int = (a: int, b: int, a: int) => a + b + a
  let r: int = f(1, 2, 3)
  console.log('' + r)
}
