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
 * @id EXP_07_23_02_037_RUNTIME_FLOAT_INF_DIVISION
 * @expect runtime
 * @section 7.23.2
 * @design 验证 IEEE 754 浮点除法 Infinity 规则：
 *         - Infinity / finite = signed Infinity
 *         - nonzero finite / 0 = signed Infinity
 *         - -Infinity / finite = signed -Infinity
 * @note 运行时用例：验证除法 Infinity 产生规则
 */
function main(): void {
  let inf: double = 1.0 / 0.0
  let negInf: double = -1.0 / 0.0

  // Infinity / finite = signed Infinity
  let r1: double = inf / 3.0
  if (r1 != 1.0 / 0.0) {
    throw new Error('Inf/3 should be Inf')
  }

  // -Infinity / finite = signed -Infinity
  let r2: double = negInf / 3.0
  if (r2 != -1.0 / 0.0) {
    throw new Error('-Inf/3 should be -Inf')
  }

  // nonzero finite / 0 = signed Infinity
  let r3: double = 5.0 / 0.0
  if (r3 != 1.0 / 0.0) {
    throw new Error('5/0 should be Inf')
  }

  // Negative finite / 0 = signed -Infinity
  let r4: double = (-5.0) / 0.0
  if (r4 != -1.0 / 0.0) {
    throw new Error('(-5)/0 should be -Inf')
  }
console.log('verified')
}
main()
