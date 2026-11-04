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
 * @id LEX_02_03_043_RT_UNICODE_WHITESPACE
 * @expect runtime
 * @section 2.3
 * @design Unicode 空白字符运行时验证
 * @note runtime 用例：验证 Unicode 空白字符不影响运算结果
 */

function main(): void {
  // Unicode 空白字符不影响运算
  let x1:int = 1
  let y1:int = 2
  let z1:int = x1 + y1
  if (z1 !== 3) { throw new Error("Unicode whitespace failed, got " + z1) }

  // 全角空格不影响运算
  let x2:int = 10
  let　y2:int = 20
  let z2:int = x2 + y2
  if (z2 !== 30) { throw new Error("Fullwidth space failed, got " + z2) }
}
