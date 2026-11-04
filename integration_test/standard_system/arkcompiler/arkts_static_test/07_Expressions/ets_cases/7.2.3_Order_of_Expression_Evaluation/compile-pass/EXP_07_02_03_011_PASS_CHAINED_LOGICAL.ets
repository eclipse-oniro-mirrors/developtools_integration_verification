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
 * @id EXP_07_02_03_011_PASS_CHAINED_LOGICAL
 * @expect compile-pass
 * @section 7.2.3
 * @design 验证链式逻辑运算编译通过：连续 && 或 || 的求值顺序
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: boolean = true && false && true;
  let b: boolean = false || true || false;
  let c: boolean = (1 > 0) && (2 < 3) && (4 == 4);
  let d: boolean = (1 > 2) || (3 > 1) || (5 < 0);
  console.log('' + a + b + c + d);
}
