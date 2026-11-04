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
 * @id EXP_07_01_01_001_PASS_GROUPING_PAREN
 * @expect compile-pass
 * @section 7.1.1
 * @design 括号 `()` 优先级最高，`(2 + 3) * 4` 先计算括号内加法再乘法
 * @note 正向用例：验证括号分组运算符最高优先级
 */
function testGroupingParen(): void {
  let a: int = (2 + 3) * 4
  let b: int = (10 / 2) + 3
  let c: int = ((1 + 2) * (3 + 4))
}
