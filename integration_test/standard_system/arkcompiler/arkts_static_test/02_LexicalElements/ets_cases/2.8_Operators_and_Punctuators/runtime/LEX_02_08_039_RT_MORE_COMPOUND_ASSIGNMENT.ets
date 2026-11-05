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
 * @id LEX_02_08_039_RT_MORE_COMPOUND_ASSIGNMENT
 * @expect runtime
 * @section 2.8
 * @design 更多复合赋值运行时验证
 * @note runtime 用例：验证更多复合赋值运算符的运行时行为
 */

function main(): void {
  // 指数赋值
  let x1 = 2
  x1 **= 3
  if (x1 !== 8) { throw new Error("**= failed, got " + x1) }

  // 移位赋值
  let x2 = 1
  x2 <<= 2
  if (x2 !== 4) { throw new Error("<<= failed, got " + x2) }

  let x3 = 8
  x3 >>= 1
  if (x3 !== 4) { throw new Error(">>= failed, got " + x3) }

  let x4 = -1
  x4 >>>= 1
  // >>>= converts to unsigned
  if (x4 !== 2147483647) { throw new Error(">>>= failed, got " + x4) }
}
