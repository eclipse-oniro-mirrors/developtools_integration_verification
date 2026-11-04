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
 * @id EXP_07_01_01_002_PASS_MULTIPLICATIVE_BEFORE_ADDITIVE
 * @expect compile-pass
 * @section 7.1.1
 * @design 乘法 `*` `/` `%` 优先级高于加法 `+` `-`，左结合
 * @note 正向用例：验证乘法优先于加法
 */
function testMultiplicativeBeforeAdditive(): void {
  let a: int = 2 + 3 * 4
  let b: int = 10 - 6 / 3
  let c: int = 2 * 3 + 4 % 3
  let d: int = 8 / 4 + 2 * 3
}
