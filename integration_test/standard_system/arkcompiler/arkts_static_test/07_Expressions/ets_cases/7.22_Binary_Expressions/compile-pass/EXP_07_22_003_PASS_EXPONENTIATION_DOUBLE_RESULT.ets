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
 * @id EXP_07_22_003_PASS_EXPONENTIATION_DOUBLE_RESULT
 * @expect compile-pass
 * @section 7.22
 * @design 验证幂运算符 ** 对数值类型返回 double：
 *          int**int→double, float**int→double,
 *          long**int→double, double**int→double
 *         bigint**bigint→bigint（已在 002 验证）
 * @note 正向用例：任何数值类型组合的幂运算返回 double
 */
function main(): void {
  let a: int = 2
  let b: int = 3
  let c: float = 2.5 as float
  let d: long = 10

  // int ** int → double (typeof => "number")
  let r1 = a ** b
  let r1Type = typeof(r1)
  if (r1Type != 'number') {
    throw new Error('int**int should be number, got ' + r1Type)
  }

  // float ** int → double (typeof => "number")
  let r2 = c ** a
  let r2Type = typeof(r2)
  if (r2Type != 'number') {
    throw new Error('float**int should be number, got ' + r2Type)
  }

  // long ** int → double (typeof => "number")
  let r3 = d ** a
  let r3Type = typeof(r3)
  if (r3Type != 'number') {
    throw new Error('long**int should be number, got ' + r3Type)
  }

  // double ** int → double (typeof => "number")
  let r4 = 3.5 ** a
  let r4Type = typeof(r4)
  if (r4Type != 'number') {
    throw new Error('double**int should be number, got ' + r4Type)
  }
console.log('verified')
}
main()
