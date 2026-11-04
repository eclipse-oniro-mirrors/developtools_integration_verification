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
 * @id EXP_07_01_01_016_PASS_MIXED_OPERATOR_CHAIN
 * @expect compile-pass
 * @section 7.1.1
 * @design 多级运算符混合表达式，按优先级规则正确编译
 * @note 正向用例：验证多种运算符混合使用
 */
function testMixedOperatorChain(): void {
  let a: int = 2 + 3 * 4 << 1
  let b: int = 10 >> 1 + 2 * 3
  let c: boolean = 1 + 2 < 3 + 4
  let d: boolean = 5 * 2 > 3 << 1 && true
  let e: int = 1 | 2 ^ 3 & 4 << 1
}
