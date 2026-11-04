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
 * @id EXP_07_25_02_039_RUNTIME_FLOAT_OVERFLOW
 * @expect runtime
 * @section 7.25.2
 * @design 验证浮点加法溢出到有符号 Infinity。
 *         spec：如果和的大小太大无法表示，则操作溢出，结果是有适当符号的 Infinity。
 *         永不抛异常。
 * @note 运行时用例：浮点加法溢出
 */
function main(): void {
  let posInf: double = 1.0 / 0.0
  let negInf: double = -1.0 / 0.0

  // 非常大的数相加 → +Infinity
  let huge: double = 1.0e308
  let r1: double = huge + huge
  if (r1 != posInf) {
    throw new Error('1e308+1e308 should overflow to +Infinity, got ' + r1)
  }

  // 非常大的负数相加 → -Infinity
  let hugeNeg: double = -1.0e308
  let r2: double = hugeNeg + hugeNeg
  if (r2 != negInf) {
    throw new Error('(-1e308)+(-1e308) should overflow to -Infinity, got ' + r2)
  }

  // 大正数 + 大正数 → +Infinity
  let r3: double = 1.0e200 + 1.0e200
  // Should be finite (2e200 fits in double)
  if (r3 != 2.0e200) {
    throw new Error('1e200+1e200 should be 2e200, got ' + r3)
  }
console.log('verified')
}
main()
