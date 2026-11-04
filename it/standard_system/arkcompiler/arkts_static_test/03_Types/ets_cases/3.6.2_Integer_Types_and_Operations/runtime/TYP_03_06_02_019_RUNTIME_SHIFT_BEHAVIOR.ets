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
 * @id TYP_03_06_02_019_RUNTIME_SHIFT_BEHAVIOR
 * @expect runtime
 * @section 3.6.2
 * @design 移位运算行为：算术 vs 逻辑右移
 * @note 运行时用例：>> 保留符号位，>>> 高位补 0
 */
function main(): void {
  // 正数：>> 与 >>> 等价
  let pos: int = 16
  if ((pos >> 2) != 4) {
    throw new Error("16 >> 2 should be 4")
  }
  if ((pos >>> 2) != 4) {
    throw new Error("16 >>> 2 should be 4")
  }

  // 负数：>> 保留符号位
  let neg: int = -16
  if ((neg >> 2) != -4) {
    throw new Error("-16 >> 2 should be -4")
  }

  // 负数：>>> 高位补 0，结果是大正数
  let logical: int = neg >>> 2
  if (logical >= 0 && logical != 1073741820) {
    throw new Error("-16 >>> 2 unexpected: " + logical)
  }

  // 左移
  if ((1 << 31) != -2147483648) {
    throw new Error("1 << 31 should be int min")
  }

  console.log("Shift behavior verified")
}