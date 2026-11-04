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
 * @id LEX_02_09_03_016_RT_NAN_DETECTION
 * @expect runtime
 * @section 2.9.3
 * @design NaN 检测验证
 * @note runtime 用例：验证 NaN 检测函数
 */

function main(): void {
  // 验证 NaN 检测
  let x1: double = 0.0 / 0.0
  if (!x1.isNaN()) { throw new Error("0.0/0.0 should be NaN") }

  // 验证正常值不是 NaN
  let x2: double = 3.14
  if (x2.isNaN()) { throw new Error("3.14 should not be NaN") }

  // 验证 Infinity 不是 NaN
  let x3: double = 1.0 / 0.0
  if (x3.isNaN()) { throw new Error("Infinity should not be NaN") }

  // 验证 NaN 的比较行为
  let x4: double = 0.0 / 0.0
  if (x4 === x4) { throw new Error("NaN should not equal itself") }
}
