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
 * @id EXP_07_01_01_020_PASS_COMPLEX_EXPRESSION
 * @expect compile-pass
 * @section 7.1.1
 * @design 复杂表达式验证多级运算符优先级的正确编译
 * @note 正向用例：含多级优先级的复杂表达式
 */
function testComplexExpression(): void {
  let a: int = 3
  let b: int = 5
  let c: boolean = a + b * 2 > 10 && a << 1 == b
  let d: int = a++ * 2 + b-- * 3
  let e: long = (a ** 2 + b * 3).toLong() >> 1
  let f: int = (a + b) * (a - b) / 2
}
