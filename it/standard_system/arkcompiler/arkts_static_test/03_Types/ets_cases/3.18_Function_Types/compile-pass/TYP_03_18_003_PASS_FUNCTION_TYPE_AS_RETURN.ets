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
 * @id TYP_03_18_003_PASS_FUNCTION_TYPE_AS_RETURN
 * @expect compile-pass
 * @section 3.18
 * @design 函数类型作为返回值
 * @note 正向用例：验证函数类型作为函数返回值
 */
type Transformer = (x: int) => int

function getIncrementer(): Transformer {
  return (x: int): int => { return x + 1 }
}

function getMultiplier(factor: int): (x: int) => int {
  return (x: int): int => { return x * factor }
}

function testFunctionTypeAsReturn(): void {
  let inc: Transformer = getIncrementer()
  let mul: (x: int) => int = getMultiplier(3)
  let r1: int = inc(5)
  let r2: int = mul(5)
}