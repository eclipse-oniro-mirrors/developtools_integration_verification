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
 * @id EXP_07_02_02_001_PASS_NORMAL_COMPLETION_ARITH
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证算术表达式正常完成：加减乘除（非零除数）在整数场景下无错误抛出
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: int = 10 + 5;
  let b: int = a - 3;
  let c: int = a * 2;
  let d: int = 20 / 4;
  let e: int = 17 % 5;
  let f: int = (a + b) * (c - d) / 2;
  console.log('' + a + b + c + d + e + f);
}
