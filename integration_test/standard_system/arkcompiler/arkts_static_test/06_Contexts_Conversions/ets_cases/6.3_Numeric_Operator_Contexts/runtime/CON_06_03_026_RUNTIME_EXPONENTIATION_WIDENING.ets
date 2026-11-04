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
 * @id CON_06_03_026_RUNTIME_EXPONENTIATION_WIDENING
 * @expect runtime
 * @section 6.3
 * @design 指数运算 widening 运行时行为: int**long, int**int
 * @note 运行时用例：实际执行验证指数运算结果
 */
function main(): void {
  let a: int = 2
  let b: long = 3
  let r1: double = a ** b
  if (r1 != 8.0) {
    throw new Error('assertion failed: 2 ** 3 should be 8.0, got ' + r1)
  }

  let c: int = 5
  let r2: double = c ** 2
  if (r2 != 25.0) {
    throw new Error('assertion failed: 5 ** 2 should be 25.0')
  }

  let d: int = 10
  let r3: double = d ** 0
  if (r3 != 1.0) {
    throw new Error('assertion failed: 10 ** 0 should be 1.0')
  }

  console.log('Exponentiation widening verified')
}
