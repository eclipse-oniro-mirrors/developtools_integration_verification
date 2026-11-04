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
 * @id EXP_07_35_01_008_FAIL_DUPLICATE_PARAM_NAME
 * @expect compile-fail
 * @section 7.35.1
 * @design 验证 Lambda 表达式声明两个同名的形式参数时产生编译时错误
 * @note 反向用例：Lambda 签名中两个形式参数同名（x, x）应产生编译时错误
 */
function main(): void {
  // 两个参数同名 x
  const f: (a: int, b: int) => int = (x: int, x: int) => x + x
  let r: int = f(1, 2)
  console.log('' + r)
}
