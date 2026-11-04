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
 * @id EXP_07_23_01_032_RUNTIME_FLOAT_NAN
 * @expect runtime
 * @section 7.23.1
 * @design 验证 IEEE 754 NaN 乘法规则：
 *         - NaN * 任何数 = NaN
 *         - Infinity * 0 = NaN（因为无穷乘零是未定式）
 * @note 运行时用例：浮点 NaN 乘法行为
 */
function main(): void {
  // 获取 NaN: 0.0 / 0.0
  let nanVal: double = 0.0 / 0.0
  // 获取 Infinity: 1.0 / 0.0
  let infVal: double = 1.0 / 0.0

  // NaN * 任何数 = NaN
  let r1: double = nanVal * 5.0
  if (r1 == r1) {
    throw new Error('NaN * 5.0 should be NaN, but got a number')
  }

  // NaN * NaN = NaN
  let r2: double = nanVal * nanVal
  if (r2 == r2) {
    throw new Error('NaN * NaN should be NaN, but got a number')
  }

  // Infinity * 0 = NaN
  let r3: double = infVal * 0.0
  if (r3 == r3) {
    throw new Error('Infinity * 0.0 should be NaN, but got ' + r3)
  }

  // -Infinity * 0 = NaN
  let negInfVal: double = -1.0 / 0.0
  let r4: double = negInfVal * 0.0
  if (r4 == r4) {
    throw new Error('-Infinity * 0.0 should be NaN, but got ' + r4)
  }
console.log('verified')
}
main()
