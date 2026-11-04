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
 * @id EXP_07_02_02_008_PASS_NORMAL_FUNC_CALL
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证函数调用正常完成：函数调用表达式作为求值过程正常返回
 * @note 正向用例：验证该特性编译通过的正确用法
 */

function add(a: int, b: int): int {
  return a + b;
}

function compute(x: int): int {
  return x * 2;
}

function main(): void {
  let r1: int = add(3, 4);
  let r2: int = compute(r1);
  let r3: int = add(r1, compute(r2));
  console.log('' + r1 + r2 + r3);
}
