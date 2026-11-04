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
 * @id EXP_07_02_03_008_PASS_PAREN_OVERRIDE
 * @expect compile-pass
 * @section 7.2.3
 * @design 验证括号覆盖优先级编译通过：括号显式改变求值顺序
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function main(): void {
  let a: int = (1 + 2) * 3;
  let b: int = 1 + (2 * 3);
  let c: int = (10 - 2) / (2 + 2);
  let d: int = (1 + 2 + 3) * (4 - 1);
  console.log('' + a + b + c + d);
}
