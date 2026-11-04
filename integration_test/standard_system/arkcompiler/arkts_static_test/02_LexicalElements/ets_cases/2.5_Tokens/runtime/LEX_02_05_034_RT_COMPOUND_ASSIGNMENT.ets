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
 * @id LEX_02_05_034_RT_COMPOUND_ASSIGNMENT
 * @expect runtime
 * @section 2.5
 * @design 复合赋值 Token 的运行结果
 * @note 运行时用例：+= -= *= /= %=
 */
function main(): void {
  let x: int = 10
  x += 5
  if (x !== 15) { throw new Error("x !== 15 after +=") }
  x -= 3
  if (x !== 12) { throw new Error("x !== 12 after -=") }
  x *= 2
  if (x !== 24) { throw new Error("x !== 24 after *=") }
  x /= 4
  if (x !== 6) { throw new Error("x !== 6 after /=") }
  x %= 4
  if (x !== 2) { throw new Error("x !== 2 after %=") }
}
