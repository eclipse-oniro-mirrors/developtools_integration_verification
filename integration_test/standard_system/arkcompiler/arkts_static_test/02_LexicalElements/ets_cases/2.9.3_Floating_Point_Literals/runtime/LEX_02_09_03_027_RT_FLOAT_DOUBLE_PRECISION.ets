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
 * @id LEX_02_09_03_027_RT_FLOAT_DOUBLE_PRECISION
 * @expect runtime
 * @section 2.9.3
 * @design float vs double 精度运行时验证
 * @note runtime 用例：验证 float vs double 精度差异
 */

function main(): void {
  // float 精度
  let x1: float = 3.141592653589793f
  // float 只有约 7 位有效数字
  if (x1 < 3.141592f || x1 > 3.141594f) { throw new Error("float precision failed, got " + x1) }

  // double 精度
  let x2: double = 3.141592653589793
  // double 有约 15-17 位有效数字
  if (x2 < 3.141592653589792 || x2 > 3.141592653589794) { throw new Error("double precision failed, got " + x2) }

  // float vs double 精度差异
  let x3: float = 1.0f / 3.0f
  let x4: double = 1.0 / 3.0
  // double 精度更高
  if (x3 === x4) { throw new Error("float and double should have different precision") }

  // float 转 double
  let x5: double = x3
  // 精度损失后转换
  if (x5 === x4) { throw new Error("float to double should preserve precision loss") }
}
