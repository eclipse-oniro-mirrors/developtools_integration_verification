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
 * @id EXP2_17_04_009_PASS_EXPRESSION_DIMENSION
 * @expect compile-pass
 * @section 17.4
 * @design 表达式维度：维度为 int 算术表达式（计算结果为正），验证编译通过
 * @note 正向用例：验证维度可以是可计算为 int 的表达式
 */
function testExpressionDimensionCreation(): void {
  let base: int = 3
  let extra: int = 2
  let arr = new number[base + extra](0)
  console.log(arr.length)
}
