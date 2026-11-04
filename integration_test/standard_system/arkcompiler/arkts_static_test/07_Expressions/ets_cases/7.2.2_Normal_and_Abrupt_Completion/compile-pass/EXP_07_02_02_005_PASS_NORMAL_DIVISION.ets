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
 * @id EXP_07_02_02_005_PASS_NORMAL_DIVISION
 * @expect compile-pass
 * @section 7.2.2
 * @design 验证整数除法正常完成：非零除数场景，无 ArithmeticError
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: int = 100 / 5;
  let b: int = a / 2;
  let c: int = 99 / 3;
  let d: int = c / b;
  let x: int = 7;
  let y: int = 3;
  let e: int = x / y;
  console.log('' + a + b + c + d + e);
}
