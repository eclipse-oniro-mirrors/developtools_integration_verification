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
 * @id EXP_07_23_01_039_RUNTIME_NEVER_THROWS
 * @expect runtime
 * @section 7.23.1
 * @design 验证乘法运算从不抛异常。
 *         spec：The evaluation of a multiplication operator '*'
 *         never throws an error despite possible overflow,
 *         underflow, or loss of information.
 * @note 运行时用例：各种极端场景乘法不抛异常
 */
function main(): void {
  // 1. int 溢出不抛异常
  let r1: int = 2147483647 * 2
  // 仍然能执行到这里

  // 2. 浮点溢出不抛异常
  let huge: double = 1e200
  let r2: double = huge * huge
  // 仍然能执行到这里

  // 3. 浮点下溢不抛异常（很小的数相乘 → 0 或 subnormal）
  let tiny: double = 1e-200
  let r3: double = tiny * tiny
  // 仍然能执行到这里

  // 4. NaN 不抛异常
  let nan: double = 0.0 / 0.0
  let r4: double = nan * 5.0
  // 仍然能执行到这里

  // 5. Infinity * 0 = NaN 不抛异常
  let inf: double = 1.0 / 0.0
  let r5: double = inf * 0.0
  // 仍然能执行到这里

  // 6. 大数 bigint 乘法不抛异常
  let big1: bigint = 999999999999999999999999999999n
  let big2: bigint = 888888888888888888888888888888n
  let r6: bigint = big1 * big2
  // 仍然能执行到这里

  console.log('verified')
}
main()
